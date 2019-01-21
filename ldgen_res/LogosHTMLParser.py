#!/usr/bin/python

from HTMLParser import HTMLParser

# class Stack:
#      def __init__(self):
#          self.items = []
#      def isEmpty(self):
#          return self.items == []
#      def push(self, item):
#          self.items.append(item)
#      def pop(self):
#          return self.items.pop()
#      def peek(self):
#          return self.items[len(self.items)-1]
#      def size(self):
#          return len(self.items)

class LogosHTMLParser(HTMLParser):
    def __init__(self, htmlstring):
        HTMLParser.__init__(self)
        self.latexString = ''
        self.current_section = ''
        self.current_tag = ''
        self.latexString += "\\documentclass{logosDoc}\n\\begin{document}\n"
        self.feed(htmlstring)

    def handle_starttag(self, tag, attrs):
        self.current_tag = tag

    def handle_data(self, data):
        data = data.strip()

        if self.current_tag == 'h1' and data != '':
            self.latexString += "\\LDTitle{" + data + "}\n\n"
            self.latexString += "\LDBegin\n\n"
            # self.current_section = "Title"

        # if self.current_tag == 'h1':
        #     if data == 'Title':
        #         self.latexString += "\\LDTitle{"
        #         self.current_section = "Title"
        #     if data == 'Initial':
        #         self.latexString += "\n\\LDInitial\n"
        #         self.current_section = "Initial"
        #     if data == 'Premises':
        #         self.latexString += "\n\\LDPremises\n"
        #         self.current_section = "Premises"
        #     if data == 'Synthesis':
        #         self.latexString += "\n\\LDSynthesis\n"
        #         self.current_section = "Synthesis"
        #     if data == 'Conclusions':
        #         self.latexString += "\n\\LDConclusions\n"
        #         self.current_section = "Conclusions"

        if self.current_tag == 'p':
            # if self.current_section == 'Title':
            #     self.latexString += data + "}\n\n"
            #     self.latexString += "\LDBegin\n\n"
            #     self.current_section = 'ENDING_Title' # for making sure you don't have any additional title paragraphs
            # elif self.current_section == 'Initial':
            #     ...
            # elif self.current_section == 'Premises':
            #     ...
            # elif self.current_section == 'Synthesis':
            #     ...
            # elif self.current_section == 'Conclusions':
            #     ...
            # elif self.current_section != 'ENDING_Title':
            self.latexString += "\n" + data + "\n"

    def handle_endtag(self, tag):
        pass # ++++++++++?????

    def getLatexString(self):
        self.latexString += "\\end{document}"
        return self.latexString
