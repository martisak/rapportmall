\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{martin}[2005/03/08 First edition]
%\LoadClass[a4paper, 10pt,twoside]{scrreprt}
\LoadClass[
    twoside,openright,cleardoublepage=empty,
    paper=a4,fontsize=11pt, % Binding correction, paper type and font size
    swedish,american, % Languages, change this to your language(s)
    ]{scrreprt}
\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{report}
}
\ProcessOptions\relax

\RequirePackage{url}

\makeatletter
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\setcounter{figure}{0}\setcounter{equation}{0}\setcounter{table}{0} \normalfont\Large\sffamily\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\sffamily\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\sffamily\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\sffamily\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\sffamily\bfseries}}

\renewcommand*\l@section{\bfseries\@dottedtocline{1}{1.5em}{2.3em}}

\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\sffamily\contentsname
        \@mkboth{%
           \MakeUppercase\sffamily\contentsname}{\MakeUppercase\sffamily\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\sffamily\listfigurename}%
      \@mkboth{\MakeUppercase\sffamily\listfigurename}%
              {\MakeUppercase\sffamily\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }

\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\sffamily\listtablename}%
      \@mkboth{%
          \MakeUppercase\sffamily\listtablename}%
         {\MakeUppercase\sffamily\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }

\renewenvironment{thebibliography}[1]
     {\chapter*{\sffamily\bibname}%
      \@mkboth{\MakeUppercase\sffamily\bibname}{\MakeUppercase\sffamily\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\makeatother

%--------------------------------------------------------
% URL
%--------------------------------------------------------

% Define a new 'leo' style for the package that will use a smaller font.
\makeatletter
\def\url@leostyle{%
  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{%
    \def\UrlFont{\small\ttfamily}}\Url@do
}
\makeatother

% Now actually use the newly defined style.
%\urlstyle{leo}

%--------------------------------------------------------
% Ingenting på "tomma" sidor.
%--------------------------------------------------------

    % Clear Header Style on the Last Empty Odd pages
    \makeatletter
    \def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else%
        \hbox{}%
        \thispagestyle{empty}%              % Empty header styles
        \newpage%
        \if@twocolumn\hbox{}\newpage\fi\fi\fi}
    \makeatother

%---------------------------------------------------------
% Innehållsförteckning
%---------------------------------------------------------

%% Control the fonts and formatting used in the table of contents.

\RequirePackage[titles]{tocloft}

%% Aesthetic spacing redefines that look nicer to me than the defaults.

\setlength{\cftbeforechapskip}{2ex}
\setlength{\cftbeforesecskip}{0.5ex}

%% Use Helvetica-Narrow Bold for Chapter entries

%\renewcommand{\cftsecfont}{\bfseries}

%\makeatletter
%\renewcommand{\@pnumwidth}{1.75em}
%\renewcommand{\@tocrmarg}{2.75em}
%\makeatother

\renewcommand{\thefigure}{\thesection.\arabic{figure}}
\renewcommand{\thetable}{\thesection.\arabic{table}}
\renewcommand{\theequation}{\thesection.\arabic{equation}}

%---------------------------------------------------------
% Slask
%---------------------------------------------------------

% Ordinary nth order (\Od) and 1st order (\OD) derivative
% Ex: \Od{3}{f}{x}  \OD{f}{x}
\newcommand{\Od}[3]{\frac{d^{#1}#2}{d#3^{#1}}}
\newcommand{\OD}[2]{\frac{d#1}{d#2}}

% Partial nth order (\Pd) and 1st order (\PD) derivative
% Ex: \Pd{2}{f}{y} \PD{f}{y}
\newcommand{\Pd}[3]{\frac{\partial^{#1}#2}{\partial#3^{#1}}}
\newcommand{\PD}[2]{\frac{\partial#1}{\partial#2}}

% Binomial, fungerar inte med amsmath
% Ex: \binom{3}{5}
%\newcommand{\binom}[2]{\pmatrix{ \mbox{\small{\it #1\rm}} \cr
%\mbox{\small{\it #2\rm}}}}

% Fourier and Laplace transform symbols
% Ex: \Fourier \Laplace
\newcommand{\Fourier}{\mathcal{F}}
\newcommand{\Laplace}{\mathcal{F}}

% Real and Complex
% Ex: \Real \Complex
\newcommand{\Real}{\mathbf{R}}
\newcommand{\Complex}{\mathbf{C}}

% Real and imaginary parts (nicer than \Re and \Im)
% Ex \real \imag
\newcommand{\real}{\mathrm{Re}\ }
\newcommand{\imag}{\mathrm{Im}\ }

% n/m fractions
% Ex: \nfrac{2}{3}
\newcommand{\nfrac}[2]{{}^{#1}\!\!/\!{}_{#2}}

\newcommand{\itquote}[1]{
  \begin{quote}
  \emph{``#1''}
\end{quote}}

\newcommand{\itauthquote}[2]{
\begin{quote}
\emph{``#1''}
\begin{flushright}\small{ - #2}\end{flushright}
\end{quote}}

\newcommand{\clearonepage}{
 \newpage
 \textbf{\large{}}
 \thispagestyle{empty}
 \newpage
}

\newcommand{\rubrik}[3]{
\begin{center}
  \textbf{\Huge{#1}}\vspace{0.5cm}

  \large{#2}

  \textsc{\large{#3}}

  \vspace{5 cm}

}

\newcommand{\student}[2]{
\begin{tabular}{c}
  \small{#1}\\
 \small{\emph{#2}}\\
\end{tabular}
}

\newcommand{\nyterm}[2]{\textit{#1}\marginpar{\small\raggedright\textbf{#1,} #2}}
\newcommand{\bilaga}{\clearpage\appendix\renewcommand{\thesection}{\Alph{section}}\thispagestyle{plain}}
