% This document class defines the Logos Document Format
% 
% Author: Andrew Torgesen, 2017

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{logosDoc}[Logos Document Definition]
\RequirePackage{palatino}

% Load the Base Class
\LoadClass[12pt]{article}

\usepackage{graphicx}
\usepackage{tikz}
\usepackage{enumitem}
\usepackage{cleveref}
\usepackage{textcomp} % For drawing inline arrows
\usepackage{parskip} % Adds spacing between paragraphs
\setlength{\parindent}{0pt} % Indent paragraphs

%\newlength{\drop}
\definecolor{titlepagecolor}{cmyk}{.75,.75,.75,.75}

% Begin Requirements
\RequirePackage{ifthen}

% Specialized Commands and Objects
\newlist{premises}{enumerate}{10}

\setlist[premises,1]{leftmargin=*, itemsep=3pt, parsep=3pt, label=\textbf{(P\arabic*)}}

\setlist[premises,2]{leftmargin=*, itemsep=3pt, parsep=3pt, label=\textbf{(P\arabic{premisesi}.\arabic*)}}

\setlist[premises,3]{leftmargin=*, itemsep=3pt, parsep=3pt, label=\textbf{(P\arabic{premisesi}.\arabic{premisesii}.\arabic*)}}

\newcommand{\premise}[2]{
\item 
#2
\label{#1}
}

\newlist{synthesis}{enumerate}{10}

\setlist[synthesis,1]{leftmargin=*, itemsep=3pt, parsep=3pt, label=\textbf{(S\arabic*)}}

\setlist[synthesis,2]{leftmargin=*, itemsep=3pt, parsep=3pt, label=\textbf{(S\arabic{synthesisi}.\arabic*)}}

\setlist[synthesis,3]{leftmargin=*, itemsep=3pt, parsep=3pt, label=\textbf{(S\arabic{synthesisi}.\arabic{synthesisii}.\arabic*)}}

\renewcommand{\textleftarrow}{$\leftarrow$}

\newcommand{\synth}[3]{
	\item 
	\textbf{\textleftarrow}\hspace{4pt}#2\hspace{2pt}\textbf{:} #3
	\label{#1}
}

% Custom Document Designs
\newcommand{\verticaltitleoffset}{85pt}
\newcommand{\titlepagedecoration}{%
	\begin{tikzpicture}[remember picture,overlay,shorten >= -10pt]
	
	\coordinate (aux1) at ([yshift=\verticaltitleoffset]current page.south west);
	\coordinate (aux2) at ([yshift=\verticaltitleoffset]current page.south east);
	\coordinate (aux3) at ([yshift=-\verticaltitleoffset]current page.north east);
	\coordinate (aux4) at ([yshift=-\verticaltitleoffset]current page.north west);
	
	\begin{scope}[titlepagecolor,line width=2.5pt]
	\draw%[shorten <= -10pt]
	(aux3) --
	++(-225:3) coordinate[pos=0.45] (c) --
	++(45:3.1);
	\draw
	(aux3) --
	(c) --
	++(-135:2.5) --
	++(-45:2.5) --
	++(45:2.5) coordinate[pos=0] (f3) coordinate[pos=0.3] (d);   
	\draw 
	(d) -- +(-45:1);
	\draw%[shorten <= -10pt]
	(aux2) --
	++(225:3) coordinate[pos=0.45] (c) --
	++(-45:3.1);
	\draw
	(aux2) --
	(c) --
	++(135:2.5) --
	++(45:2.5) --
	++(-45:2.5) coordinate[pos=0] (f2) coordinate[pos=0.3] (d);   
	\draw 
	(d) -- +(45:1);
	\draw
	(f2) -- 
	++(90:16.5);
	\draw%[shorten <= -10pt]
	(aux1) --
	++(-225:-3) coordinate[pos=0.45] (c) --
	++(45:-3.1) coordinate[pos=0] (e);
	\draw
	(aux1) --
	(c) --
	++(-135:-2.5) --
	++(-45:-2.5) --
	++(45:-2.5) coordinate[pos=0] (f1) coordinate[pos=0.3] (d);   
	\draw 
	(d) -- +(-45:-1);
	\draw
	(e) --
	++(0:17);
	\draw%[shorten <= -10pt]
	(aux4) --
	++(225:-3) coordinate[pos=0.45] (c) --
	++(-45:-3.1) coordinate[pos=0] (e);
	\draw
	(aux4) --
	(c) --
	++(135:-2.5) --
	++(45:-2.5) --
	++(-45:-2.5) coordinate[pos=0] (f4) coordinate[pos=0.3] (d);   
	\draw 
	(d) -- +(45:-1);
	\draw
	(e) --
	++(0:17);
	\draw
	(f1) -- 
	++(90:16.5);
	\end{scope}
	\end{tikzpicture}%
}

\newcommand{\sectiondecoration}{%
	\begin{tikzpicture}[remember picture,overlay,shorten >= -10pt]

	\coordinate (aux3) at ([yshift=-\verticaltitleoffset]current page.north east);

	\begin{scope}[titlepagecolor,line width=2.5pt]
	\draw
	(aux3) --
	++(-225:3) coordinate[pos=0.45] (c) --
	++(45:3.1) coordinate[pos=0] (e);
	\draw
	(aux3) --
	(c) --
	++(-135:2.5) --
	++(-45:2.5) --
	++(45:2.5) coordinate[pos=0] (f3) coordinate[pos=0.3] (d);   
	\draw 
	(d) -- +(-45:1);
	\draw
	(f3) -- ++(270:23);
%	\draw
%	(e) -- ++(180:16.57);
	\end{scope}
	\end{tikzpicture}%
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Title Page Definition
\newcommand{\LDTitle}[1]
{
	\begin{titlepage}
		%\drop=0.1\textheight
		\centering
		\vspace*{5.0cm}
		\large \textsc{An Essay by Andrew Torgesen} 	% Subtitle
		\\[1.0cm]
		\rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt}
		\rule{\textwidth}{0.4pt}\\[\baselineskip]
		\LARGE \uppercase{#1}\\[0.2\baselineskip]
		\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt}
		\rule{\textwidth}{1.6pt}
		\\[2.0cm]
		\large \textsc{\today}
		\titlepagedecoration
		\vfill
		%{\large ANDREW TORGESEN}\par
	\begin{center}
		\includegraphics[width=0.35\textwidth]{Andrew_Torgesen_black.pdf}
	\end{center}
	\end{titlepage}
}

% New Section Definitions
\newcommand{\LDInitial}{
	\newpage
	\section{Initial Thoughts}
	\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt}
	\rule{\textwidth}{1.6pt}\vspace{0.5cm}
	\sectiondecoration
}

\newcommand{\LDBegin}{
	\newpage
	\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt}
	\rule{\textwidth}{1.6pt}\vspace{0.5cm}
	\sectiondecoration
}

\newcommand{\LDPremises}{
	\newpage
	\section{Premises}
	\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt}
	\rule{\textwidth}{1.6pt}\vspace{0.1cm}
	\sectiondecoration
}

\newcommand{\LDSynthesis}{
	\newpage
	\section{Synthesis}
	\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt}
	\rule{\textwidth}{1.6pt}\vspace{0.25cm}
	\sectiondecoration	
}

\newcommand{\LDConclusions}{
	\newpage
	\section{Conclusions}
	\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt}
	\rule{\textwidth}{1.6pt}\vspace{0.5cm}
	\sectiondecoration
}
