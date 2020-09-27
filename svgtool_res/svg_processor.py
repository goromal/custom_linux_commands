#!/usr/bin/python

import os, sys, re
from lxml import etree

class SVGProcessor(object):
    def __init__(self, insvg, outsvg):
        self.ofname = outsvg
        self.root = etree.parse(insvg).getroot()
        self.ns = self.root.tag[:-3]

    def rmText(self):
        for text_node in self.root.iter(self.ns + 'text'):
            text_node.getparent().remove(text_node)

    def rmMatlab(self):
        width = self.root.get('width')
        height = self.root.get('height')
        top_g = self.root.find(self.ns + 'g')
        g_children = top_g.getchildren()
        mfs = list()
        for g_child in g_children:
            g_gchild = g_child.find(self.ns + 'rect')
            if not g_gchild is None and (g_gchild.get('width') == width) and (g_gchild.get('height') == height):
                mfs.append(g_child)
        for mf in mfs:
            top_g.remove(mf)

    def export(self):
        with open(self.ofname, 'w') as outfile:
            outfile.write(etree.tostring(self.root, pretty_print=True))

if __name__ == '__main__':
    SVGP = SVGProcessor(sys.argv[1], sys.argv[3])
    if sys.argv[2] == 'rmtext':
        SVGP.rmText()
    elif sys.argv[2] == 'clean-matlab':
        SVGP.rmMatlab()
    SVGP.export()
