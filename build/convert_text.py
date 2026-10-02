"""C024: rewrite course identity + WSQ layer in labs/*.{md,sql,txt} and the LG Markdown mirror."""
import pathlib, re

REPO = "https://github.com/tertiarycourses/C024-SQL-Masterclass"
SUBS = [
    ("SQL Fundamental for Beginners (TGS-2020505790) · v14", "SQL Masterclass (C024) · v1"),
    ("SQL Fundamental for Beginners (TGS-2020505790)", "SQL Masterclass (C024)"),
    ("**WSQ Course Code:** TGS-2020505790 · **Version v14**", "**Course Code:** C024 · **Version v1**"),
    ("**WSQ Course Code:** TGS-2020505790  |", "**Course Code:** C024  |"),
    ("**Version v14 · 11 August 2026**", "**Version v1 · 2 October 2026**"),
    ("**TGS-2020505790** · v14", "**C024** · v1"),
    ("the WSQ course SQL Masterclass", "the course SQL Masterclass"),
    ("SQL Fundamental for Beginners", "SQL Masterclass"),
    (" The guide is an approved open-book reference during the final assessment.", ""),
    ("Skills Framework: Data Engineering (ICT-DIT-3005-1.1), ICT Skills Framework.\n\n", ""),
    ("download the datasets folder from the course materials on https://lms-tms.tertiaryinfotech.com.",
     f"download the labs/_all folder from the course repository at {REPO}."),
    ("LMS course materials", "course repository (labs/)"),
    ("Download the course mock data from the LMS. You want the datasets folder",
     "Download the course mock data from the course repository. You want the labs/_all folder"),
    ("https://lms-tms.tertiaryinfotech.com\n", REPO + "\n"),
    ("Continue with the recommended WSQ courses", "Continue with the recommended courses"),
    ("- Complete the TRAQOM feedback survey and download your e-certificate from https://lms-tms.tertiaryinfotech.com after being assessed Competent.",
     "- Complete the course feedback form and collect your Certificate of Achievement from the trainer."),
    ("courseware/labs/", "labs/"),
    ("- [How You Will Be Assessed](#how-you-will-be-assessed)\n", ""),
]


def rewrite(f):
    s = f.read_text(encoding="utf-8")
    o = s
    for a, b in SUBS:
        s = s.replace(a, b)
    s = re.sub(r"\n## How You Will Be Assessed\n.*?(?=\n## )", "\n", s, flags=re.S)
    s = re.sub(r"\s*\(TSC mapping: [^)]*\)", "", s)
    s = re.sub(r"\s*\((?:[AK]\d+(?:, )?)+\)\.", ".", s)
    if s != o:
        f.write_text(s, encoding="utf-8")
        return 1
    return 0


files = [p for p in pathlib.Path("labs").rglob("*") if p.suffix in (".md", ".sql", ".txt")]
files.append(pathlib.Path("LG-SQL Masterclass (C024).md"))
print(sum(rewrite(f) for f in files), "files rewritten")
