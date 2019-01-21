#!/usr/bin/python

import sys
import mistune
from LogosHTMLParser import LogosHTMLParser

md = mistune.Markdown()

docname = sys.argv[1]

with open('%s.md' % docname,'r') as mdfile, open('%s.tex' % docname,'w') as texfile:
    # s = md(mdfile.read())
    parser = LogosHTMLParser(md(mdfile.read()))
    # print s
    texfile.write(parser.getLatexString())
