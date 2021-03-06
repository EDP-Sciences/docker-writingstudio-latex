\NeedsTeXFormat{LaTeX2e}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      ita  class for LaTeX2e                         %%
%%%      Pierre Damphousse                              %%
%%%      Copyright (C) EDP Sciences                     %%
%%%      Version 1.2. September 2002                    %%
%%%      tex-support@edpsciences.com                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --> THE CLASS OPTION MATERIAL
%% --> THE CLASS PRESENTATION MATERIAL
%% --> THE SECTIONING MATERIAL
%% --> THE METRIC DATA
%% --> THE TOP MATTER MATERIAL
%----  (A) The MAKETITLE command and its components
%----  (B) Preparing the MAKETITLE components
%          -1-   Heading
%          -2-   Title and Running Title
%          -3-   Authors and Running authors
%          -4-   Date
%          -5-   Subject Class
%          -6-   Resume
%          -7-   Abstract
%          -8-   Address (\address, given after the \author command)
%          -9-   Thanks  (given after the title: \thanks)
%% --> MISCELLANEOUS
%% --> MESSAGES
%% --> VARIOUS MACROS
%----  (A) LATIN ABBREVIATIONS
%----  (B) REFERENCES
%----  (C) NEWTHEOREM AND ENVIRONMENTS
%----  (D) MATHEMATICS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%-----------------------------------------------------------------------------
%% --> THE CLASS OPTION MATERIAL
%%-----------------------------------------------------------------------------
\ProvidesClass{ita}[1999/03/01 v1.1 EDP-Sciences]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions\relax
%%-----------------------------------------------------------------------------
%% --> THE CLASS PRESENTATION MATERIAL
%%-----------------------------------------------------------------------------
\LoadClass[reqno]{amsart}[1996/10/24]
\RequirePackage{cite}
%%-----------------------------------------------------------------------------
%% --> THE SECTIONING MATERIAL
%%-----------------------------------------------------------------------------
\def\section{\@startsection{section}{1}\z@{1.2\linespacing\@plus\linespacing}%
{\linespacing} {\fontsize{12}{14}\selectfont\scshape\centering}}
\def\subsection{\@startsection{subsection}{2}\z@{\linespacing\@plus.8\linespacing}%
{.8\linespacing}{\fontsize{10}{12}\selectfont\scshape}}
\def\subsubsection{\@startsection{subsubsection}{3}\z@{.7\linespacing\@plus.5\linespacing}%
{.5\linespacing}{\normalfont\itshape}}
\def\paragraph{\@startsection{paragraph}{4}\z@\z@{-\fontdimen2\font}\normalfont}
\def\subparagraph{\@startsection{subparagraph}{5}\z@\z@{-\fontdimen2\font}\normalfont}
%%-----------------------------------------------------------------------------
%% --> THE METRIC DATA
%%-----------------------------------------------------------------------------
\setlength\oddsidemargin {15pt}\setlength\evensidemargin{15pt}
\setlength{\textwidth}{125mm}\setlength{\textheight}{190mm}
\setlength{\headheight}{18pt}
%%-----------------------------------------------------------------------------
%% --> THE TOP MATTER MATERIAL
%%-----------------------------------------------------------------------------
% =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   
%----  (A) The MAKETITLE command and its components
\def\@maketitle{%
  \normalfont\normalsize
  \let\@makefnmark\relax \let\@thefnmark\relax
  \global\def\shorttitle{\@MSSG@RNNGTTL}
  \global\def\shortauthors{\@MSSG@RNNGTHR}
  \@mkboth{\@nx\shortauthors}{\@nx\shorttitle}%
  \global\topskip42\p@\relax
  \@SKIP@Aa
  \vbox{\hbox to\hsize{{\fontsize{10}{12}\selectfont{\bf\@NMJRNL@E}}\hfill%
  {\fontsize{8}{9}\selectfont\@JRNL@X}}
  \hbox to\hsize{\fontsize{8}{9}\selectfont{\@NMJRNL@F}\hfill}}
  \@SKIP@Ab
  \@setkeywords
  \@settitle
  \@setauthors
  \@setabstract
  \@setresume
  \@setsubjclass
  \normalsize
  \if@titlepage\newpage\else\dimen@34\p@\advance\dimen@-\baselineskip\vskip\dimen@\relax\fi
  \gdef\thanks##1{\relax}\gdef\address##1{\relax}
}% end \@maketitle
% =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   =   
%----  (B) Preparing the MAKETITLE components
%................ ................ ................ ................  ................
%          -1-   Heading
%................ ................ ................ ................  ................
\def\@SKIP@Aa{\vspace*{-1.5cm}}%
\def\@SKIP@Ab{\vspace*{1.5cm}}%
\def\@NMJRNL@F{{Informatique Th\'eorique et Applications}}%
\def\@NMJRNL@E{{Theoretical Informatics and Applications}}%
\def\@JRNL@X{{Will be set by the publisher}}%
\def\idline#1page#2{\global\def\@JRNL@X{#1}\setcounter{page}{#2}}
%................ ................ ................ ................  ................
%          -2-   Title and Running Title
%................ ................ ................ ................  ................
\def\@settitle{\begin{center}\fontsize{11}{15}\selectfont\bfseries
    \uppercasenonmath\@title\@title\@thnks@i\@thnks@ii\@thnks@iii\@thnks@iv\@thnks@v
\ifnum\the\@c@thnks@=0\else\footnote{\box\@b@thnks@}\fi
\end{center}}
\newbox\@b@rnngttl
\def\runningtitle#1{\setbox\@b@rnngttl=\hbox{\fontsize{7}{9}\selectfont\rm\uppercase{#1}}}
%................ ................ ................ ................  ................
%          -3-   Authors and Running authors
%................ ................ ................ ................  ................
\def\@setauthors{\begingroup\trivlist
  \centering\footnotesize \@topsep30\p@\relax\advance\@topsep by -\baselineskip
  \item\relax\fontsize{12}{14}\selectfont\scshape\@@th@rs\ignorespaces
  \footnote{\box\@b@ddrss@}\endtrivlist\endgroup}
\def\email#1{{e-mail: \tt#1}}
\newbox\@b@rnngthr
\def\runningauthors#1{\setbox\@b@rnngthr=\hbox{#1}%
\global\def\@rnngthrs{\fontsize{7}{9}\selectfont\rm\uppercase{#1}}}
\newcount\@c@thr@\@c@thr@=0
\def\author#1{\global\advance\@c@thr@ by 1
          \global\expandafter\edef\csname @thr@\romannumeral\@c@thr@\endcsname{#1}
          \global\expandafter\edef\csname @Mthr@\romannumeral\@c@thr@\endcsname{\uppercase{#1}}
          \global\expandafter\def\csname @ddrss@\romannumeral\@c@thr@\endcsname{}
          \global\expandafter\def\csname @scndddrss@\romannumeral\@c@thr@\endcsname{}
          \global\expandafter\def\csname @smddrss@\romannumeral\@c@thr@\endcsname{}}%\author
%    Elaborating the two author lists (First page and heading)
\newcount\@y\newcount\@x
\def\@cnjctn{\ifnum\the\@c@thr@=1\null\else{{\ and\ }}\fi}
\def\@Mcnjctn{\ifnum\the\@c@thr@=1\null\else{{\ AND\ }}\fi}
\def\@@th@rs{\@x=0\global\@y=\@c@thr@\global\advance\@y by -1
\loop\advance\@x by 1
\ifnum\the\@x<\the\@y\csname  @thr@\romannumeral\@x\endcsname\ignorespaces
            ${}^{\csname  @ddrss@\romannumeral\@x\endcsname
                 \csname  @smddrss@\romannumeral\@x\endcsname
                 \csname  @scndddrss@\romannumeral\@x\endcsname}$,
\repeat
\csname  @thr@\romannumeral\@y\endcsname\ignorespaces
            ${}^{\csname  @ddrss@\romannumeral\@y\endcsname
                 \csname  @smddrss@\romannumeral\@y\endcsname
                 \csname  @scndddrss@\romannumeral\@y\endcsname}$\@cnjctn
\csname  @thr@\romannumeral\@c@thr@\endcsname\ignorespaces
            ${}^{\csname  @ddrss@\romannumeral\@c@thr@\endcsname
                 \csname  @smddrss@\romannumeral\@c@thr@\endcsname
                 \csname  @scndddrss@\romannumeral\@c@thr@\endcsname}$}%\@@th@rs
\def\M@@th@rs{\@x=0\global\@y=\@c@thr@\global\advance\@y by -1
\loop\advance\@x by 1
\ifnum\the\@x<\the\@y\csname  @Mthr@\romannumeral\@x\endcsname,
\repeat
\csname  @Mthr@\romannumeral\@y\endcsname\@Mcnjctn
\csname  @Mthr@\romannumeral\@c@thr@\endcsname}%\M@@th@rs
\def\@qq#1#2{\vrule height#1 depth#2 width0pt}
%................ ................ ................ ................  ................
%          -4-   Date and editor 
%................ ................ ................ ................  ................
\let\@date\@empty
\def\@setdate{\noindent\fontsize{8}{10}\selectfont\hbox{\@date\@addpunct.}}
\def\editor#1{\def\@editor{#1}}
\let\@editor\@empty
\def\@seteditor{\vskip6\p@\noindent\fontsize{8}{10}\selectfont\noindent\hbox{Communicated by 
\@editor\@addpunct.}}
%................ ................ ................ ................  ................
%          -5-   Subject Class
%................ ................ ................ ................  ................
%
\def\@setsubjclass{\skip@20\p@\advance\skip@-\lastskip\advance\skip@-\baselineskip\vskip\skip@
  \moveright 3pc\hbox{{\bfseries\subjclassname.}\enspace \@subjclass \@addpunct.}} %
\renewcommand{\subjclassname}{AMS Subject Classification}
%
\newbox\@b@kwrds
\def\keywords#1{\global\setbox\@b@kwrds\vtop{\advance\hsize by-12pt
    \noindent\footnotesize\textit{\@MSSG@KWRD@0K}#1\@qq{0pt}{4pt}}}
\def\@setkeywords{\ifvoid\@b@kwrds\else\footnote{\box\@b@kwrds}\fi}
%................ ................ ................ ................  ................
%          -6-   Resume
%................ ................ ................ ................  ................
\newbox\resumebox
\newenvironment{resume}{\ifx\maketitle\relax\ClassWarning{\@classname}{\@MSSG@CLSSWRNG}\fi
  \global\setbox\resumebox=\vtop\bgroup\fontsize{9}{11}\selectfont\advance \hsize -6pc
  \trivlist 
    \labelsep.5em\item[\hskip\labelsep{\scshape\fontsize{10}{12}\selectfont\bf R\'esum\'e}.]}
{\endtrivlist\egroup\ifx\@setresume\relax \@setresumea \fi}
\def\@setresume{\@setresumea\global\let\@setresume\relax}
\def\@setresumea{\skip@20\p@\advance\skip@-\lastskip\advance\skip@-\baselineskip \vskip\skip@
  \ifvoid\resumebox\else\moveright 3pc \box\resumebox\fi}
%................ ................ ................ ................  ................
%          -7-   Abstract
%................ ................ ................ ................  ................
\newbox\abstractbox
\renewenvironment{abstract}{\ifx\maketitle\relax\ClassWarning{\@classname}{\@MSSG@CLSSWRNGBSTRCT}\fi
  \global\setbox\abstractbox=\vtop\bgroup\fontsize{9}{11}\selectfont 
  \advance \hsize -6pc
  \trivlist 
    \labelsep.5em\item[\hskip\labelsep{\scshape\fontsize{10}{12}\selectfont\bf Abstract}.]}
{\endtrivlist\egroup\ifx\@setabstract\relax \@setabstracta \fi}
\def\@setabstract{\@setabstracta\global\let\@setabstract\relax}
\def\@setabstracta{\skip@20\p@ \advance\skip@-\lastskip \advance\skip@-\baselineskip \vskip\skip@
  \ifvoid\abstractbox{\hbox to\hsize{\kern3pc\fontsize{10}{12}
          \selectfont\bf \hbox to55pt{Abstract\hfill}\qquad\@MSSG@BSTRCT\hfill}}
    \else\moveright 3pc \box\abstractbox \fi}
%................ ................ ................ ................  ................
%                Address         (\address, given after the \author command)
%         -8-    Same Address    (\sameaddress, given after the \author command)
%                Second Address  (\secondaddress, given after the \author command)
%................ ................ ................ ................  ................
\def\@spc{\kern1pt}\def\@spcc{\kern2pt}
\newcount\@c@ddrss@\newbox\@b@ddrss@
%
\def\@dd@ddrss@#1{%
\global\setbox51=\vbox{\advance\hsize by-12pt\unvbox\@b@ddrss@
  \vtop{\footnotesize\noindent{${}^{\the\@c@ddrss@}$\ }\@qq{10pt}{0pt}\textrm{#1}}}
  \global\setbox\@b@ddrss@=\vbox{\unvbox51}}%
%
\def\@dd@scndddrss@#1{%
\global\setbox51=\vbox{\advance\hsize by-12pt\unvbox\@b@ddrss@
  \vtop{\footnotesize\noindent{${}^{\the\@c@ddrss@}$\ }\@qq{10pt}{0pt}\textrm{#1}}}
  \global\setbox\@b@ddrss@=\vbox{\unvbox51}}
%
\def\address#1{\global\advance\@c@ddrss@ by 1\@dd@ddrss@{#1}
  \expandafter\edef\csname @ddrss@\romannumeral\@c@thr@\endcsname{\@spc\number\@c@ddrss@}}
\def\secondaddress#1{\global\advance\@c@ddrss@ by 1\@dd@ddrss@{#1}
  \expandafter\edef\csname @scndddrss@\romannumeral\@c@thr@\endcsname%
{,\@spcc\number\@c@ddrss@}}%\secondaddress#1
\def\sameaddress#1{\expandafter\edef\csname @smddrss@\romannumeral\@c@thr@\endcsname{\@spc{}#1}}
%................ ................ ................ ................  ................
%          -9-   Thanks  (given in the title: \thanks)
%................ ................ ................ ................  ................
\def\@rmnnmrl#1{\ifcase#1\null\or*\or**\or***\or****\or*****\else\@MSSG@THNKS\fi}
\def\@thnks@i{}\def\@thnks@ii{}\def\@thnks@iii{}\def\@thnks@iv{}\def\@thnks@v{}
\newcount\@c@thnks@\newbox\@b@thnks@
\def\@dd@thnks@#1{%
\global\setbox50=\vbox{\advance\hsize by-12pt\unvbox\@b@thnks@
  \vtop{\noindent\footnotesize{${}^{\@rmnnmrl\@c@thnks@}$\ }\@qq{10pt}{0pt}\textit{#1}\hfill}}
\global\setbox\@b@thnks@=\vbox{\unvbox50}}%
\def\thanks#1{\global\advance\@c@thnks@ by 1\@dd@thnks@{#1}%
\global\expandafter\edef\csname @thnks@\romannumeral\@c@thnks@\endcsname{%
\ifnum\the\@c@thnks@=1\@spcc${}^{\@rmnnmrl\@c@thnks@}$\else$^{,\@spcc\@rmnnmrl\@c@thnks@}$\fi}}
%%-----------------------------------------------------------------------------
%% --> MISCELLANEOUS
%%-----------------------------------------------------------------------------
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
%
\renewcommand\normalsize{\@xsetfontsize\normalsize 6%
  \@adjustvertspacing \let\@listi\@listI 
  \abovedisplayskip 11pt \@plus2pt \@minus2pt
  \belowdisplayskip \abovedisplayskip}
%
\def\ps@firstpage{\ps@plain
  \def\@oddfoot{\hfill{\scriptsize \copyright\ EDP Sciences 1999}}%
  \let\@evenfoot\@oddfoot\def\@oddhead{\null\hss}
  \let\@evenhead\@oddhead}% in case an article starts on a left-hand page
%
\def\ps@headings{\ps@empty
  \def\@evenhead{\normalfont\scriptsize\llap{\normalsize\thepage\kern-4pt}\hfil\scriptsize\leftmark{}{}\hfil}%
  \def\@oddhead{\normalfont\scriptsize\hfil\rightmark{}{}\hfil\rlap{\kern-4pt\normalsize{\thepage}}}%
  \let\@mkboth\markboth}
\def\ps@myheadings{\ps@headings \let\@mkboth\@gobbletwo}\pagestyle{headings}
%%-----------------------------------------------------------------------------
%% --> MESSAGES
%%-----------------------------------------------------------------------------
\def\@MSSG@THNKS{At most 5 thanks allowed}
\def\@MSSG@CLSSWRNGRSM{Resume should precede \protect\maketitle\space in AMS documentclasses; reported}
\def\@MSSG@CLSSWRNGBSTRCT{Abstract should precede \protect\maketitle\space in AMS documentclasses; 
           reported}
\def\@MSSG@KWRD{{WARNING:  --- Give at least one key words ---}}
\def\@MSSG@KWRD@0K{{Keywords and phrases:\ }}
\def\@MSSG@SBJCTCLSS{{--- Give AMS classification codes  ---}}
\def\@MSSG@RSM{{WARNING:  --- Il est obligatoire de donner un r\'esum\'e en fran\c cais! ---}}
\def\@MSSG@BSTRCT{{WARNING:  --- An English abstract is mandatory! ---}}
\def\@MSSG@DT{{(The dates will be set by the publisher)}}
\def\@MSSG@DTR{{(The editor will be set by the publisher)}}
%% September 2002
\def\@MSSG@RNNGTTL{\uppercase{Title will be set by the publisher}}
\def\@MSSG@RNNGTHR{\uppercase{Title will be set by the publisher}}
%
\def\@date{\@MSSG@DT}
\def\@editor{\@MSSG@DTR}
\def\@subjclass#1{\@MSSG@SBJCTCLSS}
%%-----------------------------------------------------------------------------
%% --> VARIOUS MACROS
%%-----------------------------------------------------------------------------
%................ ................ ................ ................  ................
%----  (A) LATIN ABBREVIATIONS
%................ ................ ................ ................  ................
\def\cf{\emph{cf.\/}}\def\ie{\emph{i.e.\/}}\def\etc{\emph{etc\/}}
\def\apriori{\emph{a priori\/}}\def\afortiori{\emph{a fortiori\/}}
\def\loccit{\emph{a loc. cit.\/}}\def\etal{\emph{et al.\/}}
\def\vg{\emph{v.g.\/}}
%................ ................ ................ ................  ................
%----  (B) REFERENCES
%................ ................ ................ ................  ................
\def\@Rref#1{\hbox{\rm \ref{#1}}}
\def\Rref#1{\@Rref{#1}}
%................ ................ ................ ................  ................
%----  (C) NEWTHEOREM AND ENVIRONMENTS
%................ ................ ................ ................  ................
%-------------------
\theoremstyle{plain}
%-------------------
\newtheorem{thrm}{Theorem}[section]
\newtheorem{lmm}[thrm]{Lemma}
\newtheorem{crllr}[thrm]{Corollary}
\newtheorem{prpstn}[thrm]{Proposition}
\newtheorem{crtrn}[thrm]{Criterion}
\newtheorem{lgrthm}[thrm]{Algorithm}
%------------------------
\theoremstyle{definition}
%------------------------
\newtheorem{dfntn}[thrm]{Definition}
\newtheorem{cnjctr}[thrm]{Conjecture}
\newtheorem{xmpl}[thrm]{Example}
\newtheorem{prblm}[thrm]{Problem}
\newtheorem{rmrk}[thrm]{Remark}
\newtheorem{nt}[thrm]{Note}
\newtheorem{clm}[thrm]{Claim}
\newtheorem{smmr}[thrm]{Summary}
\newtheorem{cs}[thrm]{Case}
\newtheorem{bsrvtn}[thrm]{Observation}
%
%-------------------
\theoremstyle{plain}
%-------------------
\newenvironment{acknowledgement}{\par\addvspace{17pt}\small\rmfamily\noindent}{\par\addvspace{6pt}}
%................ ................ ................ ................  ................
%----  (D) MACROS FOR MATHEMATICS
%................ ................ ................ ................  ................
\def\xQuaternion{\mathbb{H}} \def\xC{\mathbb{C}} \def\xR{\mathbb{R}}
\def\xQ{\mathbb{Q}} \def\xZ{\mathbb{Z}} \def\xN{\mathbb{N}}
\def\xP{\mathbb{P}} \def\xA{\mathbb{A}}
%--
\def\xCzero{{\rm C}^{0}}
\def\xCone{{\rm C}^{1}} 
\def\xCtwo{{\rm C}^{2}} 
\def\xCinfty{{\rm C}^{\infty}} 
\def\xCn#1{{\rm C}^#1}
%--
\def\xHzero{{\rm H}^{0}}
\def\xHone{{\rm H}^{1}}
\def\xHtwo{{\rm H}^{2}} 
\def\xHinfty{{\rm H}^{\infty}}
\def\xHn#1{{\rm H}^#1}
%
\def\xWzero{{\rm W}^{0}}
\def\xWone{{\rm W}^{1}}
\def\xWtwo{{\rm W}^{2}} 
\def\xWinfty{{\rm W}^{\infty}}
\def\xWn#1{{\rm W}^#1}
%
\def\xLzero{{\rm L}^{0}}
\def\xLone{{\rm L}^{1}}
\def\xLtwo{{\rm L}^{2}} 
\def\xLinfty{{\rm L}^{\infty}} 
\def\xLn#1{{\rm L}^#1}
%-- 
\def\xDif{{\rm D}}
\def\xdif{\,{\rm d}}
%-- 
\def\xdrv#1#2{\frac{{\rm d}#1}{{\rm d}#2}}%  "d#1 over d#2"
\def\xDrv#1#2{\frac{{\rm d}}{{\rm d}#2}#1}%  "d   over d#2  #1"
%--
\def\xker{\mathop{\rm ker\,}\nolimits}
\def\xcoker{\mathop{\rm coker\,}\nolimits}
\def\xim{\mathop{\rm im\,}\nolimits}
\def\xcoim{\mathop{\rm coim\,}\nolimits}
\def\xdim{\mathop{\rm dim\,}\nolimits}
\def\xcodim{\mathop{\rm codim\,}\nolimits}
\def\xtr{\mathop{\rm tr\,}\nolimits}
\def\xHom{\mathop{\rm Hom\,}\nolimits}
\def\xExt{\mathop{\rm Ext\,}\nolimits}
\def\xTor{\mathop{\rm Tor\,}\nolimits}
%--
\def\xGL{\mathop{\rm GL\,}\nolimits}
\def\xSL{\mathop{\rm SL\,}\nolimits}
\def\xPSL{\mathop{\rm PSL\,}\nolimits}
\def\xSO{\mathop{\rm SO\,}\nolimits}
\def\xSU{\mathop{\rm SU\,}\nolimits}
%
\def\xProof{
  \normalfont
  \medskip
  {\noindent\itshape Proof.\hspace*{6pt}\ignorespaces}}
%
\def\enddoc@text{\ifx\@empty\@translators \else\@settranslators\fi
  \ifx\@empty\@editor \else\@seteditor\\\fi
  \ifx\@empty\@date \else\@setdate\fi}
%
%
\endinput
