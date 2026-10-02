"""C024 deck fix-ups after convert_deck.py: schedule, outline/recap TSC codes, feedback, lunch, LMS refs."""
import re, copy
from pptx import Presentation

F = "courseware/SQL Masterclass-v1.pptx"
p = Presentation(F)
W, H = p.slide_width, p.slide_height


def put(par, text):
    runs = par.runs
    runs[0].text = text
    for r in runs[1:]:
        r.text = ""


def paras(slide):
    for sh in slide.shapes:
        if sh.has_text_frame:
            for par in sh.text_frame.paragraphs:
                if par.runs:
                    yield sh, par


def title(slide):
    for sh, par in paras(slide):
        if sh.top / H < 0.2 and 0.1 < sh.top / H:
            return par.text
    return ""


EXACT = {
    "WSQ courses on SQL, databases, data engineering, analytics and AI.": "Courses on SQL, databases, data engineering, analytics and AI.",
    "75% attendance is required.": "Full attendance — attend the whole day to get the most from the course.",
    "Tools:  SQLite Studio, sgmart.db mock database, LMS course materials": "Tools:  SQLite Studio, sgmart.db mock database, course repository (labs/)",
    "Get sgmart.db from the LMS": "Get sgmart.db from the course repo",
    "LMS / TMS": "Course Materials",
    "lms-tms.tertiaryinfotech.com": "github.com/tertiarycourses/C024-SQL-Masterclass",
    # Course Feedback slide (was Certificate & TRAQOM Survey)
    "Certificate & TRAQOM Survey (Mandatory)": "Course Feedback & Certificate",
    "Log in to lms-tms.tertiaryinfotech.com": "Attend the full day and complete all 11 labs",
    "Complete the TRAQOM course feedback survey — mandatory for WSQ funding": "Complete the course feedback form — tell us what worked",
    "Be assessed as Competent in the PP and OQ": "Receive your Certificate of Achievement",
    "Download your e-certificate from the LMS": "Continue with a recommended next course",
    # Schedule slide
    "•  Morning (9:30 am – 1:30 pm)": "•  Morning (9:30 am – 1:00 pm)",
    "–  Welcome, introductions & digital attendance (AM)": "–  Welcome, introductions & course overview",
    "–  Topic 2: Data Processing & Analysis — Labs 4–6": "–  Topic 2: Data Processing & Analysis — Lab 4",
    "–  Lunch break (1:30 – 2:30 pm)": "–  Lunch break (1:00 – 1:30 pm)",
    "•  Afternoon (2:30 pm – 6:30 pm)": "•  Afternoon (1:30 pm – 5:30 pm)",
    "–  Topic 3: Data Transformation — Labs 7–9": "–  Topic 2 (cont.): Insert, Update & Delete — Labs 5–6",
    "–  Topic 4: Introduction to Data Warehouse — Labs 10–11": "–  Topic 3: Data Transformation — Labs 7–9",
    "–  Course feedback (TRAQOM) & Assessment digital attendance": "–  Topic 4: Introduction to Data Warehouse — Labs 10–11",
    "–  Briefing, then Final Assessment: PP (70 min) + OQ (20 min)": "–  Course recap, Q&A & course feedback",
    "1:30 pm – 2:30 pm": "1:00 pm – 1:30 pm",
}

for i, s in enumerate(p.slides):
    for sh, par in paras(s):
        t = par.text
        new = EXACT.get(t, t)
        new = re.sub(r"^C024 MAPPING · .*$", "KEY CONCEPTS", new)                    # was TSC MAPPING · A1, K1…
        new = re.sub(r"\s*\((?:[AK]\d+(?:, )?)+\)$", "", new)                       # (A1, A2, K1, K2) / (A3, A5)
        if new != t:
            put(par, new)

# ---- move the lunch slide to just after "Lab 4" verify (lunch now 1:00-1:30 pm)
lst = p.slides._sldIdLst
ids = list(lst)
lunch = next(i for i, s in enumerate(p.slides) if any(par.text == "Lunch Break" for _, par in paras(s)))
lab4 = next(i for i, s in enumerate(p.slides)
            if any(par.text == "LAB 4 · VERIFY" for _, par in paras(s)))
el = ids[lunch]
lst.remove(el)
ids = list(lst)
ids[lab4].addnext(el)

# ---- footers: bottom-right number = index + 1
for i, s in enumerate(p.slides):
    for sh in s.shapes:
        if sh.has_text_frame and sh.top / H > 0.85 and sh.left / W > 0.5 and sh.text_frame.text.strip().isdigit():
            put(sh.text_frame.paragraphs[0], str(i + 1))

p.save(F)
print("fixed", F, len(p.slides), "slides; lunch now at", lab4 + 1)
