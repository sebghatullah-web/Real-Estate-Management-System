const fs = require('fs');
const zlib = require('zlib');

const path = 'C:/Users/Wali Zadah/OneDrive/Documents/KCC_Residential_Collection_Natural_English.pdf';
const d = fs.readFileSync(path);
const buf = Buffer.from(d);

// ---- ASCII85 decode ----
function ascii85Decode(data) {
    let out = [];
    let i = 0;
    let n = data.length;
    let chunk = [];
    while (i < n) {
        const c = data[i];
        if (c === 0x3c && i + 1 < n && data[i+1] === 0x7e) { i += 2; continue; }
        if (c === 0x7e && i + 1 < n && data[i+1] === 0x3e) { i += 2; continue; }
        if (c === 0x7a) { // 'z'
            out.push(0,0,0,0);
            i++;
            continue;
        }
        if (c === 0x0d || c === 0x0a || c === 0x20) { i++; continue; }
        chunk = [];
        while (chunk.length < 5 && i < n) {
            const cc = data[i];
            if (cc === 0x0d || cc === 0x0a || cc === 0x20) { i++; continue; }
            if (cc === 0x7e && i+1 < n && data[i+1] === 0x3e) break;
            chunk.push(cc);
            i++;
        }
        if (chunk.length === 0) break;
        const pad = 5 - chunk.length;
        while (chunk.length < 5) chunk.push(0x75); // 'u'
        let value = 0;
        for (let j = 0; j < 5; j++) value = value * 85 + (chunk[j] - 33);
        const bytes = [(value >> 24) & 0xff, (value >> 16) & 0xff, (value >> 8) & 0xff, value & 0xff];
        const toPush = pad > 0 ? bytes.slice(0, 4 - pad) : bytes;
        for (const b of toPush) out.push(b);
        if (pad > 0) break;
    }
    return Buffer.from(out);
}

// ---- Extract streams ----
const outText = [];
let searchFrom = 0;
let si = 0;
while (true) {
    const sIdx = buf.indexOf(Buffer.from('stream'), searchFrom);
    if (sIdx < 0) break;
    const nl = buf.indexOf(0x0a, sIdx);
    if (nl < 0) break;
    let eIdx = buf.indexOf(Buffer.from('endstream'), nl + 1);
    if (eIdx < 0) break;
    let raw = buf.slice(nl + 1, eIdx);
    while (raw.length > 0 && (raw[raw.length-1] === 0x0a || raw[raw.length-1] === 0x0d || raw[raw.length-1] === 0x20)) {
        raw = raw.slice(0, raw.length - 1);
    }
    searchFrom = eIdx + 9;
    const before = buf.slice(Math.max(0, sIdx - 150), sIdx);
    const beforeStr = before.toString('latin1');
    const is85 = beforeStr.includes('ASCII85Decode');
    const isFlate = beforeStr.includes('FlateDecode');

    let decoded = raw;
    if (is85) decoded = ascii85Decode(decoded);
    if (isFlate) {
        try {
            decoded = zlib.inflateSync(decoded);
        } catch (e) {
            outText.push('=== STREAM ' + si + ' (inflate FAILED: ' + e.message + ') raw=' + raw.length + ' ===');
            si++;
            continue;
        }
    }
    outText.push('=== STREAM ' + si + ' (len=' + decoded.length + ') ===\n' + decoded.toString('latin1'));
    si++;
}

fs.writeFileSync('_pdf_decoded.txt', outText.join('\n\n'));
console.log('streams:', si);

// ---- Extract printable text from content streams (PDF strings in BT/ET) ----
function extractPdfStrings(content) {
    const results = [];
    const len = content.length;
    let i = 0;
    let depth = 0;
    let cur = '';
    const push = () => {
        if (cur.trim().length > 0) results.push(cur);
        cur = '';
    };
    while (i < len) {
        const c = content[i];
        if (c === 0x5c && depth > 0 && i + 1 < len) { // backslash escape
            const nxt = content[i+1];
            if (nxt === 0x6e) cur += '\n';
            else if (nxt === 0x72) cur += '\r';
            else if (nxt === 0x74) cur += '\t';
            else if (nxt === 0x28 || nxt === 0x29) cur += String.fromCharCode(nxt);
            else if (nxt >= 0x30 && nxt <= 0x37) {
                let oct = '';
                while (i + 1 < len && oct.length < 3 && content[i+1] >= 0x30 && content[i+1] <= 0x37) {
                    oct += String.fromCharCode(content[i+1]);
                    i++;
                }
                cur += String.fromCharCode(parseInt(oct, 8));
            }
            i += 2;
            continue;
        }
        if (c === 0x28) { depth++; cur = ''; i++; continue; }
        if (c === 0x29 && depth > 0) { depth--; push(); i++; continue; }
        if (depth > 0) {
            if (c >= 0x20 && c < 0x7f) cur += String.fromCharCode(c);
            i++;
            continue;
        }
        i++;
    }
    return results;
}

// Re-run over just the 4 text streams and extract strings
searchFrom = 0;
const textLines = [];
const allResults = [];
while (true) {
    const sIdx = buf.indexOf(Buffer.from('stream'), searchFrom);
    if (sIdx < 0) break;
    const nl = buf.indexOf(0x0a, sIdx);
    if (nl < 0) break;
    let eIdx = buf.indexOf(Buffer.from('endstream'), nl + 1);
    if (eIdx < 0) break;
    let raw = buf.slice(nl + 1, eIdx);
    while (raw.length > 0 && (raw[raw.length-1] === 0x0a || raw[raw.length-1] === 0x0d || raw[raw.length-1] === 0x20)) {
        raw = raw.slice(0, raw.length - 1);
    }
    searchFrom = eIdx + 9;
    const before = buf.slice(Math.max(0, sIdx - 150), sIdx).toString('latin1');
    const is85 = before.includes('ASCII85Decode');
    let decoded = raw;
    if (is85) decoded = ascii85Decode(decoded);
    const strs = extractPdfStrings(decoded);
    for (const s of strs) allResults.push(s);
}

fs.writeFileSync('_pdf_text.txt', allResults.join('\n'), 'utf8');
console.log('text strings:', allResults.length);
for (const s of allResults) console.log(s);