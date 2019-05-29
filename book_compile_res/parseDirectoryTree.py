#!/usr/bin/python

import os, sys
import xml.etree.ElementTree as ET

def filenameOrder(itemString):
    try:
        order = int(itemString.split(' ')[0])
    except:
        order = -1
    return order

path = sys.argv[1]
src_path = os.path.join(path, 'src')

# get book info from xml
configTree = ET.parse(os.path.join(path, 'book.xml'))
configRoot = configTree.getroot()
BookTitle = configRoot.find('title').text

parseInfo = [] # list of dictionaries
min_size = len(src_path.split('/')) - 1

for root, dirs, files in os.walk(src_path):
   files.sort(key=filenameOrder)
   for filename in files:
       if filename.split('.')[-1] == 'pdf' and filenameOrder(filename) != -1:
           parseInfo.append({'filename': os.path.splitext(filename)[0], 'parents': root.split('/')[min_size+1:]})

latexCode = []
latexCodeFrontMatter = """
\\documentclass[]{article}

\\usepackage{parskip}
\\usepackage[space]{grffile}
\\usepackage{pdfpages}
\\usepackage[bookmarks=true]{hyperref}
\\usepackage{bookmark}
\\hypersetup{colorlinks=true,linkcolor=blue, linktocpage}

\\newcommand{\\addpdfsection}[2]{
\\pdfbookmark[section]{#1}{#2}
\\includepdf[pages=1-]{#2.pdf}
}

\\newcommand{\\addpdfsubsection}[2]{
\\pdfbookmark[subsection]{#1}{#2}
\\includepdf[pages=1-]{#2.pdf}
}

\\newcommand{\\addpdfsubsubsection}[2]{
\\pdfbookmark[subsubsection]{#1}{#2}
\\includepdf[pages=1-]{#2.pdf}
}

\\begin{document}

\\includepdf[pages=1]{TitlePage.pdf}
"""
latexCode.append(latexCodeFrontMatter)


def fileInfoKey(fileInfo):
    BASE_WEIGHT = 1000000
    MID_WEIGHT = 1000
    LOW_WEIGHT = 1
    depth = len(fileInfo['parents'])
    keyval = 0
    if depth == 0:
        val = filenameOrder(fileInfo['filename'])
        keyval = BASE_WEIGHT * val
    elif depth == 1:
        val1 = filenameOrder(fileInfo['parents'][0])
        val2 = filenameOrder(fileInfo['filename'])
        keyval = BASE_WEIGHT * val1 + MID_WEIGHT * val2
    elif depth == 2:
        val1 = filenameOrder(fileInfo['parents'][0])
        val2 = filenameOrder(fileInfo['parents'][1])
        val3 = filenameOrder(fileInfo['filename'])
        keyval = BASE_WEIGHT * val1 + MID_WEIGHT * val2 + LOW_WEIGHT * val3
    return keyval

parseInfo.sort(key=fileInfoKey)

# for pI in parseInfo:
#     print pI, fileInfoKey(pI)

top_parent = ''
prev_top_parent = ''
bottom_parent = ''
prev_bottom_parent = ''
for fileInfo in parseInfo:
    fn = fileInfo['filename']
    depth = len(fileInfo['parents'])
    if depth == 0:
        top_parent = ''
        bottom_parent = ''
        latexCode.append('\\addpdfsection{%s}{%s}' % (fn, os.path.join(src_path, fn)))
    elif depth == 1:
        top_parent = fileInfo['parents'][0]
        bottom_parent = ''
        if top_parent != prev_top_parent:
            latexCode.append("\\pdfbookmark[section]{%(tp)s}{%(tp)s}" % {'tp': top_parent})
        latexCode.append('\\addpdfsubsection{%s}{%s}' % (fn, os.path.join(src_path, top_parent, fn)))
    elif depth == 2:
        top_parent = fileInfo['parents'][0]
        bottom_parent = fileInfo['parents'][1]
        if top_parent != prev_top_parent:
            latexCode.append("\\pdfbookmark[section]{%(tp)s}{%(tp)s}" % {'tp': top_parent})
        if bottom_parent != prev_bottom_parent:
            latexCode.append("\\pdfbookmark[subsection]{%(bp)s}{%(bp)s}" % {'bp': bottom_parent})
        latexCode.append('\\addpdfsubsubsection{%s}{%s}' % (fn, os.path.join(src_path, top_parent, bottom_parent, fn)))

    prev_top_parent = top_parent
    prev_bottom_parent = bottom_parent

latexCode.append('\\end{document}')

# for lc in latexCode:
#     print lc

# Create Title Page
with open(os.path.join(src_path, 'TitlePage.md'), 'w') as TitlePageFile:
    TitlePageFile.write('# ' + BookTitle)

# Create LaTex document
with open(os.path.join(src_path, 'Book.tex'), 'w') as BookTexFile:
    for lc in latexCode:
        BookTexFile.write(lc + '\n')
