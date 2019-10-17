% This document class defines how Andrew's Notes look.
%
% Author: Andrew Torgesen, 2018

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{andrewsNotes}[Definition of Andrew's Note Documents]
% \RequirePackage{palatino}

\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{helvet}

% Load the Base Class
\LoadClass[10pt]{article}

%\usepackage{DejaVuSerifCondensed}
\usepackage[T1]{fontenc}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{enumitem}
\usepackage[svgnames]{xcolor}  % https://www.latextemplates.com/svgnames-colors
\usepackage{titlesec}
\usepackage{graphicx}
\usepackage[font={small,it}]{caption}
\usepackage[margin=0.75in]{geometry}
\usepackage{fancyhdr}
\usepackage{parskip}
\setlength{\parindent}{0pt}

% \newcommand{\notesColor}{Red}
\newcommand{\notesColor}{SteelBlue}
% \newcommand{\notesColor}{Maroon}
% \newcommand{\notesColor}{RoyalBlue}
% \newcommand{\notesColor}{NavyBlue}

\titleformat{\section}
{\color{\notesColor}\normalfont\Large\bfseries}
{\thesection}{0.5em}{\color{black}}[{\titlerule[0.5pt]}]

\titleformat{\subsection}
{\color{\notesColor}\normalfont\large\bfseries}
{\thesubsection}{0.5em}{}

\titleformat{\subsubsection}
{\color{\notesColor}\normalfont\bfseries}
{\thesubsubsection}{0.5em}{}

\renewcommand{\labelitemi}{\textcolor{\notesColor}{$\bullet$}}
\renewcommand{\labelitemii}{\textcolor{\notesColor}{$\circ$}}
\renewcommand{\labelitemiii}{\textcolor{\notesColor}{$\ast$}}
\renewcommand{\labelitemiv}{\textcolor{\notesColor}{$\bullet$}}

\newcommand{\ts}[1]{\textsuperscript{#1}}

\makeatletter
\fancypagestyle{andrewspagestyle}{%
  \fancyhf{}% Clear header/footer
  % \fancyfoot[C]{$\nsim$~\textcolor{\notesColor}{\textbf{\thepage}}~$\nsim$}% Page # in middle/centre of footer
  \fancyfoot[C]{\textcolor{\notesColor}{\textbf{\thepage}}}% Page # in middle/centre of footer
  \renewcommand{\headrulewidth}{0pt} % no header rule
}
\makeatother
\pagestyle{andrewspagestyle}
