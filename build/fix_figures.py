"""Lab figures carry 'SQL Fundamental for Beginners · TGS-2020505790' baked into the status bar.
Redraw it as 'SQL Masterclass · C024' in figures/ and in the LG's embedded copies (matched by hash)."""
import hashlib, io, shutil, zipfile, os
from PIL import Image, ImageDraw, ImageFont

FONT = "/System/Library/Fonts/Supplemental/Arial.ttf"
TEXT = "SQL Masterclass  ·  C024"


def fix(data):
    im = Image.open(io.BytesIO(data)).convert("RGB")
    w, h = im.size
    px = im.load()
    y0, y1 = h - 50, h - 5
    bg = px[w - 5, h - 25]
    # bbox of text pixels in the right half of the status bar
    pts = [(x, y) for x in range(w // 2, w) for y in range(y0, y1)
           if sum(abs(a - b) for a, b in zip(px[x, y], bg)) > 60]
    xs, ys = [p[0] for p in pts], [p[1] for p in pts]
    bx0, bx1, by0, by1 = min(xs), max(xs), min(ys), max(ys)
    fg = min((px[x, y] for x, y in pts), key=sum)
    d = ImageDraw.Draw(im)
    d.rectangle([bx0 - 4, by0 - 3, bx1 + 2, by1 + 3], fill=bg)
    size = 10
    while ImageFont.truetype(FONT, size + 1).getbbox("SQLT")[3] - ImageFont.truetype(FONT, size + 1).getbbox("SQLT")[1] <= (by1 - by0) - 3:
        size += 1
    f = ImageFont.truetype(FONT, size)
    tb = f.getbbox(TEXT)
    d.text((bx1 - (tb[2] - tb[0]) - tb[0], by0 - tb[1]), TEXT, font=f, fill=fg)
    out = io.BytesIO(); im.save(out, "PNG")
    return out.getvalue()


src = {}
for i in range(1, 12):
    fn = f"figures/lab-{i:02d}.png"
    old = open(fn, "rb").read()
    new = fix(old)
    src[hashlib.md5(old).hexdigest()] = new
    open(fn, "wb").write(new)

doc = "courseware/LG-SQL Masterclass.docx"
tmp = doc + ".tmp"
with zipfile.ZipFile(doc) as zi, zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED) as zo:
    n = 0
    for it in zi.infolist():
        b = zi.read(it.filename)
        hsh = hashlib.md5(b).hexdigest()
        if it.filename.startswith("word/media/") and hsh in src:
            b = src[hsh]; n += 1
        zo.writestr(it, b)
os.replace(tmp, doc)
print("figures fixed: 11; LG images replaced:", n)
