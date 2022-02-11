%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Paket für Uebungsblaetter
%
%		exercisesheet.cls
%		v0.0 vom 13.03.2015
%
%		Mathias Rafler
%			rafler@math.tu-berlin.de
%
%	! Alles noch im Teststadium, dementsprechend auf seltsame Verhaltensweisen gefaßt sein
% ! Check for Updates
%
%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}% LaTeX 2.09 can't be used (nor non-LaTeX)
[1994/12/01]% LaTeX date must December 1994 or later
\ProvidesClass{exercisesheet}[2015/03/13 v0.0 LaTeX class Exercise Sheet]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic Behaviour
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Do not start from scratch, load KOMAartcl
\LoadClass[11pt, german, a4paper, pagesize]{scrartcl}
%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%
% Load LaTeX3-Packages
\RequirePackage{etoolbox}
\RequirePackage{xparse}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Load Language and Typing Packages
\RequirePackage[german]{babel}
\RequirePackage[utf8]{inputenc}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% AMS Packages
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
%\RequirePackage{amscd}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Sprache, Zeichen
\RequirePackage{mathtools}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% \"Ubergangsgraphen
\usepackage{tikz}
\usetikzlibrary{arrows}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Stil anpassen
\RequirePackage{ifthen}
\RequirePackage{enumitem}
\RequirePackage{shortlst}
\RequirePackage{diagbox}
\RequirePackage{array}
%\RequirePackage{gauss}
\RequirePackage{hyperref}
%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set Lengths
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\parskip}{1.5ex}
\setlength{\parindent}{0pt}

\setlength{\topmargin}{-29pt}
\setlength{\textheight}{699pt}%{658pt}%{699pt}
\setlength{\textwidth}{453pt}%{483pt}
\setlength{\oddsidemargin}{0pt}%{-20pt}
\setlength{\evensidemargin}{0pt}


\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
%\headheight=15pt\advance\topmargin by -\headheight
%\headsep=20pt\advance\topmargin by -\headheight

\setlength{\shortitemwidth}{119pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kopf- und Titeleidefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Daten fuer den Kopf
\ExplSyntaxOn
\prop_clear_new:N \exs_data_prop
%      public macros for setting
\NewDocumentCommand{\setVeranstaltung}{ m }
	{	\exs_set_Veranstaltung:n { #1 }	}
\NewDocumentCommand{\setSemester}{ m }
	{	\exs_set_Semester:n { #1 }	}
\NewDocumentCommand{\setVerein}{ m }
	{	\exs_set_Verein:n { #1 }	}
\NewDocumentCommand{\setverein}{ m }
	{	\exs_set_verein:n { #1 }	}
\NewDocumentCommand{\setSektion}{ m }
	{	\exs_set_Sektion:n { #1 }	}
\NewDocumentCommand{\setsektion}{ m }
	{	\exs_set_sektion:n { #1 }	}
\NewDocumentCommand{\setDozent}{ m }
	{	\exs_set_Dozent:n { #1 }	}
\NewDocumentCommand{\setAssistent}{ m }
	{	\exs_set_Assistent:n { #1 }	}
\NewDocumentCommand{\setBlattnummer}{ m }
	{	\exs_set_Blattnummer:n { #1 }	}
%      private macros for setting
\cs_new:Npn \exs_set_Veranstaltung:n #1
	{	\prop_put:Nnn \exs_data_prop { Veranstaltung } { #1 }	}
\cs_new:Npn \exs_set_Semester:n #1
	{	\prop_put:Nnn \exs_data_prop { Semester } { #1 }	}
\cs_new:Npn \exs_set_Verein:n #1
	{	\prop_put:Nnn \exs_data_prop { Verein } { #1 }	}
\cs_new:Npn \exs_set_verein:n #1
	{	\prop_put:Nnn \exs_data_prop { verein } { #1 }	}
\cs_new:Npn \exs_set_Sektion:n #1
	{	\prop_put:Nnn \exs_data_prop { Sektion } { #1 }	}
\cs_new:Npn \exs_set_sektion:n #1
	{	\prop_put:Nnn \exs_data_prop { sektion } { #1 }	}
\cs_new:Npn \exs_set_Dozent:n #1
	{	\prop_put:Nnn \exs_data_prop { Dozent } { #1 }	}
\cs_new:Npn \exs_set_Assistent:n #1
	{	\prop_put:Nnn \exs_data_prop { Assistent } { #1 }	}
\cs_new:Npn \exs_set_Blattnummer:n #1
	{	
		\prop_put:Nnn \exs_data_prop { Blattnummer } { #1 }
		\setcounter{section}{#1}
	}
%      public commands for getting information
\NewDocumentCommand{\getLecture}{ m }
	{	\exs_get_data:n { #1 }	}
%      private commands for getting information
\cs_new:Npn \exs_get_data:n #1
	{	\prop_get:NnNTF \exs_data_prop { #1 } \l_tmpa_tl 
			{ \l_tmpa_tl } { Feld #1 unbekannt }	}
\ExplSyntaxOff
%      first setup
\setVeranstaltung{Geometry}
\setSemester{Semester}
\setVerein{Mouseion at Alexandria}
\setverein{Musaeum}
\setSektion{Faculty of Geometry}
\setsektion{Institute of Geometry}
\setDozent{Aristarch}
\setAssistent{Kermit}
\setBlattnummer{1}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Header, some old version
\newcommand{\Kopf}{%
	{\sffamily\large\bfseries \getLecture{Verein} \hfill \getLecture{Semester}}\\
	{\sffamily\normalsize\bfseries \getLecture{Sektion}}\\
	{\footnotesize \getLecture{Dozent}}\\
	{\footnotesize \getLecture{Assistent}}
}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Header, new version
\renewcommand{\Kopf}{%
	\begin{minipage}[t][3Em][t]{0.4\textwidth}
		\sffamily
		{\bfseries \getLecture{verein}, \getLecture{sektion}}\\
		\getLecture{Semester}
	\end{minipage}
	\hfill
	\begin{minipage}[t][3Em][t]{0.4\textwidth}
		\sffamily\normalsize\flushright
		\getLecture{Dozent}\\
		\getLecture{Assistent}
	\end{minipage}
}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Titelei an sich
\NewDocumentCommand{\Titel}{ s o d<> }{%
	\begin{center}
		\sffamily		
		{\large\bfseries \getLecture{Veranstaltung}}\\
		\IfNoValueTF{#2}
			{	}	{
				{\Large \bfseries #2
				\IfBooleanTF{#1}
					{	}	{	\getLecture{Blattnummer}	}	}\\
			}
		\IfNoValueTF{#3}
			{	}	{	\normalsize \itshape #3	}
	\end{center}
	\addvspace{-1.5Em}
	\normalsize\noindent\hrulefill
}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Further formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Enumeration within exercises, three levels redefined
\renewcommand{\labelenumi}{(\alph{enumi})}
\renewcommand{\theenumi}{(\alph{enumi})}
\renewcommand{\labelenumii}{(\roman{enumii})}
\renewcommand{\theenumii}{(\roman{enumii})}
\renewcommand{\labelenumiii}{\arabic{enumiii}.}
\renewcommand{\theenumiii}{\arabic{enumiii}.}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% due to weird effect of an enumaration at the very beginning, use this macro
\newcommand{\neuezeile}{\mbox{}\vspace{-1.9Em}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% to draw attention to particuar items
\newcommand{\red}{\textcolor{red}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Helper makros for Gauss algorithm for drawing verical lines
\newdimen\asep
\asep=0.25\baselineskip
\providecommand{\vo}{\text{\raisebox{-\asep}[0pt][0pt]{\rule[0pt]{0.8pt}{3.5\asep}}}}
\providecommand{\vu}{\text{\raisebox{-0.5\asep}[0pt][0pt]{\rule[0pt]{0.8pt}{\baselineskip}}}}
\providecommand{\vm}{\text{\raisebox{-\asep}[0pt][0pt]{\rule[0pt]{0.8pt}{\baselineskip}}}}
\newcommand{\rowaddtolabel}{\scriptstyle }
%%%%%%%%%%%%%%%%%
% Hack f\"ur alternatives Plus bzw. optionales Minus bei Zeilenoperationen
\makeatletter
\def\g@east@arrow@a#1#2#3#4[#5]{%
 \@ifnextchar[%
 {\g@east@arrow@b{#1}{#2}{#3}{#4}{#5}}%
 {\g@east@arrow@b{#1}{#2}{#3}{#4}{#5}[\oplus]}%
}
\makeatother
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mathematical definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Analysis
\renewcommand{\d}{\operatorname{d}\!}
\newcommand{\e}{\operatorname{e}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Verteilungen
\renewcommand{\exp}{\operatorname{exp}}
\newcommand{\poisson}{\operatorname{Poi}}
\newcommand{\geometric}{\operatorname{Geom}}
\newcommand{\binomial}{\operatorname{Bin}}
\newcommand{\exponential}{\operatorname{Exp}}
\newcommand{\normal}{\operatorname{N}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Abbildungen und Matrizen
\newcommand{\rang}{\operatorname{rang}}
\renewcommand{\ker}{\operatorname{kern}}
\newcommand{\bild}{\operatorname{bild}}
\newcommand{\lin}{\operatorname{span}}
\newcommand{\vol}{\operatorname{Vol}}
\renewcommand{\div}{\operatorname{div}}
\newcommand{\spur}{\operatorname{Spur}}
\newcommand{\diag}{\operatorname{Diag}}
\newcommand{\id}{\operatorname{Id}}
\newcommand{\M}{\mathbf{M}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Pfeile
\newcommand{\ra}{\rightarrow}
\newcommand{\Ra}{\Rightarrow}
\newcommand{\gdw}{\Leftrightarrow}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Funktionen
\newcommand{\arsinh}{\operatorname{arsinh}}
\newcommand{\arcosh}{\operatorname{arcosh}}
\newcommand{\artanh}{\operatorname{artanh}}
\newcommand{\sgn}{\operatorname{sgn}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Zahlenbereiche
\newcommand{\C}{\mathbb{C}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Nnull}{\N_0}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\K}{{\mathbb{K}}}
\newcommand{\F}{{\mathbb{F}}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% sonstige Mengen
\newcommand{\Nd}{\mathsf{N}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% W-Theorie-Symbole
\newcommand{\p}{\mathbb{P}}
\newcommand{\E}{\mathbb{E}}
\newcommand{\Var}{\operatorname{\mathbb{V}}}
\newcommand{\Cov}{\operatorname{cov}}
\newcommand{\stoch}{\stackrel{\p}{\longrightarrow}}
\newcommand{\as}{\stackrel{\p\mbox{\tiny -a.s.}}{\longrightarrow}}
\newcommand{\weak}{\stackrel{\text{\textup{w}}}{\longrightarrow}}
\newcommand{\distreqq}{\stackrel{\text{\textup{d}}}{=}}
\newcommand{\median}{\operatorname{med}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Funktionenraeume
\newcommand{\V}{\mathcal{V}}
\renewcommand{\L}{\mathcal{L}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% sigma-Algebren
%\newcommand{\A}{\mathcal{A}}
%\newcommand{\B}{\mathcal{B}}
%\newcommand{\Esig}{\mathcal{E}}
%\newcommand{\Fsig}{\mathcal{F}}
%\newcommand{\M}{\mathbf{M}}
%\newcommand{\PM}{\mathfrak{P}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Filtrationen
\newcommand{\Ffil}{\mathbb{F}}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Mengen
\newcommand{\wort}{\mathcal{W}}		%Woerter

%%%%%%%%%%%%%%%%%
% fette Vektoren
\newcommand{\Xbf}{\mathbf{X}}
\newcommand{\abf}{\mathbf{a}}
\newcommand{\tbf}{\mathbf{t}}
\newcommand{\xbf}{\mathbf{x}}

%%%%%%%%%%%%%%%%%
% Punkte usw.
% http://tex.stackexchange.com/questions/4216/how-to-typeset-correctly
\newcommand{\defeq}{%
	\mathrel{ \vcenter{\baselineskip0.5ex \lineskiplimit0pt \hbox{\scriptsize.} \hbox{\scriptsize.}} } =}
\newcommand{\eqdef}{%
	= \mathrel{ \vcenter{\baselineskip0.5ex \lineskiplimit0pt \hbox{\scriptsize.} \hbox{\scriptsize.}} } }
\newcommand{\scdot}{\,\cdot\,}
\newcommand{\sth}{:}
%\newcommand{\sth}{\:|\:}
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
% Displayed operators
\newcommand{\dlim}{\displaystyle\lim}
\newcommand{\dsum}{\displaystyle\sum}
\newcommand{\dint}{\displaystyle\int}
%%%%%%%%%%%%%%%%%

\newcommand{\abs}[1]{\left\vert#1\right\vert}
%\newcommand{\arc}{\mathrm{arc}}
\newcommand{\I}{i}
\newcommand{\eps}{\varepsilon}
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\phi}{\varphi}
\renewcommand{\Re}{\mathrm{Re}}
\renewcommand{\Im}{\mathrm{Im}}
\newcommand{\Rez}[1]{\Re\left(#1\right)}
\newcommand{\Imz}[1]{\Im\left(#1\right)}
\newcommand{\qqmqq}[1]{\qquad\text{#1}\qquad}
\newcommand{\qmq}[1]{\quad\text{#1}\quad}
\newcommand{\vph}{\vphantom{\tfrac12}}
\newcommand{\VPH}{\vphantom{\dfrac12}}

\DeclareMathOperator{\grad}{\mathrm{grad}}
\DeclareMathOperator{\rot}{\mathrm{rot}}
\DeclareMathOperator{\divg}{\mathrm{div}}
\DeclareMathOperator{\tr}{\mathrm{tr}}
