#!/usr/bin/python

import sys
from os.path import join
import xml.etree.ElementTree as ET
import xml.dom.minidom as prettifier # ?

def transfer_default(def_root, book_root, element_str):
    default_str = def_root.find(element_str).text
    book_elem = ET.SubElement(book_root, element_str)
    book_elem.text = default_str

if __name__ == "__main__":

    SCRIPT_PATH = sys.argv[1]
    MANIFEST_PATH = sys.argv[2]

    DEFAULTS_FILE = join(SCRIPT_PATH, 'defaults.xml')
    MANIFEST_FILE = join(MANIFEST_PATH, 'book.xml')

    defaults_tree = ET.parse(DEFAULTS_FILE)
    defaults = defaults_tree.getroot()
    book = ET.Element('book')
    title_str = MANIFEST_PATH.split('/')[-1]
    title = ET.SubElement(book, 'title')
    title.text = title_str

    transfer_default(defaults, book, 'author')
    transfer_default(defaults, book, 'description')

    book_str = prettifier.parseString(ET.tostring(book)).toprettyxml(indent="  ")
    with open(MANIFEST_FILE, 'w') as outfile:
        outfile.write(book_str)
