% Christopher H. Gorman
% Initial Verions: 1 December 2017
%
% This class is designed to fulfill all of the requirements
% for the University of California, Santa Barbara
% dissertation requirements for 2018--2019 academic year.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucsbthesis}[2017/12/01 UCSB Thesis Class]

% Options
\DeclareOption{10pt}{
    \PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{11pt}{
    \PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{12pt}{
    \PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{letterpaper}{
    \PassOptionsToPackage{\CurrentOption}{geometry}
}
\DeclareOption{a4paper}{
    \PassOptionsToPackage{\CurrentOption}{geometry}
}

\DeclareOption{proper}{
    \PassOptionsToClass{oneside}{book}
    \PassOptionsToPackage{top=1in,bottom=1in,left=1.25in,right=1in,
        footskip=0.25in}{geometry}
    \PassOptionsToPackage{doublespacing,nodisplayskipstretch}{setspace}
    \newif\ifproper
    \propertrue
}
\DeclareOption{pretty}{
    \PassOptionsToPackage{margin=1in,footskip=0.25in}{geometry}
    \PassOptionsToPackage{singlespacing}{setspace}
    \newif\ifproper
    \properfalse
}

\newif\ifprettymath
\prettymathfalse
\DeclareOption{prettymath}{
    \prettymathtrue
}

\newif\ifadvisors
\advisorsfalse
\DeclareOption{advisors}{
    % Use if there are two (co-)advisors
    \advisorstrue
}

\newif\ifmembersthree
\membersthreefalse
\DeclareOption{members3}{
    % Use if there are three committee members, not including advisor(s)
    \membersthreetrue
}

\newif\ifmembersfour
\membersfourfalse
\DeclareOption{members4}{
    % Use if there are four committee members, not including advisor(s)
    \membersthreetrue
    \membersfourtrue
}

\newif\ifmembersfive
\membersfivefalse
\DeclareOption{members5}{
    % Use if there are four committee members, not including advisor(s)
    \membersthreetrue
    \membersfourtrue
    \membersfivetrue
}


% Option Fallback (Failure)
\DeclareOption*{
    \ClassWarning{ucsbthesis}{Unknown option '\CurrentOption'}
}

% Execute Default Options
\ExecuteOptions{12pt}
\ExecuteOptions{letterpaper}


% Process given options
\ProcessOptions\relax

% Load Base Class
\LoadClass{book}

% Required Packages
% 
% We only load those packages which are required
% for this class to work and no others.
% In particular, no mathematics classes are added,
% as that should be taken care of by the author and
% loaded in a specific preamble.

\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{setspace}

% If there are Co-Advisors
\newtoggle{advisors}
\ifadvisors
    \toggletrue{advisors}
\else
    \togglefalse{advisors}
\fi

% If there are three committee members, not including advisor(s)
\newtoggle{members3}
\ifmembersthree
    \toggletrue{members3}
\else
    \togglefalse{members3}
\fi

% If there are four committee members, not including advisor(s)
\newtoggle{members4}
\ifmembersfour
    \toggletrue{members4}
\else
    \togglefalse{members4}
\fi
% Note: when using ``members4'' option, both boolean toggles
% for member3 and members4 are true.

% If there are five committee members, not including advisor(s)
\newtoggle{members5}
\ifmembersfive
    \toggletrue{members5}
\else
    \togglefalse{members5}
\fi
% Note: when using ``members5'' option, boolean toggles
% for member3, members4, and member5 are true.

% Header and Footer information
\fancypagestyle{fancyfront}{
    % Header and footer information for front matter
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \cfoot{\thepage}
}

\fancypagestyle{fancymain}{
    % Header and footer information for front matter
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \cfoot{\thepage}
}

\fancypagestyle{fancyback}{
    % Header and footer information for front matter
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \cfoot{\thepage}
}

% Commands
\newcommand{\degreeobjective}[3]{\gdef\@degreename{#1}
                                  \gdef\@degreethesisname{#2}
                                  \gdef\@major{#3}}

\iftoggle{advisors}{
    \newcommand{\advisorA}[2]{\gdef\@advisorAname{#1}
                              \gdef\@advisorAtitle{#2}}
    \newcommand{\advisorB}[2]{\gdef\@advisorBname{#1}
                              \gdef\@advisorBtitle{#2}}
}{
    \newcommand{\advisor}[2]{\gdef\@advisorname{#1}
                              \gdef\@advisortitle{#2}}
}

\newcommand{\committeeA}[2]{\gdef\@committeeAname{#1}
                             \gdef\@committeeAtitle{#2}}
\newcommand{\committeeB}[2]{\gdef\@committeeBname{#1}
                             \gdef\@committeeBtitle{#2}}

\iftoggle{members3}{
    \newcommand{\committeeC}[2]{\gdef\@committeeCname{#1}
                                 \gdef\@committeeCtitle{#2}}
    \iftoggle{members4}{
        \newcommand{\committeeD}[2]{\gdef\@committeeDname{#1}
                                     \gdef\@committeeDtitle{#2}}
        \iftoggle{members5}{
            \newcommand{\committeeE}[2]{\gdef\@committeeEname{#1}
                                         \gdef\@committeeEtitle{#2}}
        }{
        }
    }{
    }
}{
}

\newcommand{\graduationdate}[2]{
    \gdef\@gradmonth{#1}
    \gdef\@gradyear{#2}}
\newcommand{\committeesignsdate}[2]{
    \gdef\@signmonth{#1}
    \gdef\@signyear{#2}}
\newcommand{\dedication}[1]{
    \gdef\@dedication{#1}}
\newcommand{\acknowledgements}[1]{
    \gdef\@acknowledgements{#1}}
\newcommand{\cv}[1]{
    \gdef\@cv{#1}}
\newcommand{\abstract}[1]{
    \gdef\@abstract{#1}}

% Note on font sizes:
%
% In increasing order, they are
%
% tiny, scriptsize, footnotesize, small,
% normalsize,
% large, Large, LARGE,
% huge, Huge

% Title page length
\newlength{\titlepagespacing}
\setlength{\titlepagespacing}{0.35in}

% Make the title page
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \null
    \vfill
    {
        \doublespacing
        \begin{center}
        University of California \\ Santa Barbara \\
        \vspace{\titlepagespacing}
        \textbf{\Large \@title} \\
        \vspace{\titlepagespacing}
        A \MakeLowercase{\@degreethesisname} submitted in partial satisfaction\\
        of the requirements for the degree \\ 
        \@degreename \\ in \\ \@major \\ by \\ \@author
        \end{center}
        \vspace{\titlepagespacing}
        Committee in charge: \\
        \iftoggle{advisors}{
            \indent \indent {\@advisorAtitle}~{\@advisorAname}, Co-Chair \\
            \indent \indent {\@advisorBtitle}~{\@advisorBname}, Co-Chair \\
        }{
            \indent \indent {\@advisortitle}~{\@advisorname}, Chair \\
        }
        \indent \indent {\@committeeAtitle}~\@committeeAname \\
        \indent \indent {\@committeeBtitle}~\@committeeBname \\
        \iftoggle{members3}{
            \indent \indent {\@committeeCtitle}~\@committeeCname \\
            \iftoggle{members4}{
                \indent \indent {\@committeeDtitle}~\@committeeDname \\
                \iftoggle{members5}{
                    \indent \indent {\@committeeEtitle}~\@committeeEname \\
                }{
                }
            }{
            }
        }{
        }
        \begin{center} {\@gradmonth}~{\@gradyear} \end{center}
    }
    \vfill
    \clearpage
}

% Signature page length
\newlength{\sigpagespacing}
\newlength{\sigpagespacingdate}
\iftoggle{members5}{
    \setlength{\sigpagespacing}{0.40in}
    \setlength{\sigpagespacingdate}{0.25in}
}{
    \iftoggle{members4}{
        \setlength{\sigpagespacing}{0.50in}
        \setlength{\sigpagespacingdate}{0.70in}
    }{
        \setlength{\sigpagespacing}{0.65in}
        \setlength{\sigpagespacingdate}{1.00in}
    }
}

% Make the signature page
\newcommand{\makesignature}{
    \thispagestyle{empty}
    \null
    \vfill
    \vspace*{\fill}
    {
        \doublespacing
        \begin{center}
        The \MakeLowercase{\@degreethesisname} of {\@author} is approved. \\
        \vspace{\sigpagespacing}
        \rule{3.5in}{0.4pt} \\
        {\@committeeAtitle} \@committeeAname \\
        \vspace{\sigpagespacing}
        \rule{3.5in}{0.4pt} \\
        {\@committeeBtitle} \@committeeBname \\
        \iftoggle{members3}{
            \vspace{\sigpagespacing}
            \rule{3.5in}{0.4pt} \\
            {\@committeeCtitle} \@committeeCname \\
            \iftoggle{members4}{
                \vspace{\sigpagespacing}
                \rule{3.5in}{0.4pt} \\
                {\@committeeDtitle} \@committeeDname \\
                \iftoggle{members5}{
                    \vspace{\sigpagespacing}
                    \rule{3.5in}{0.4pt} \\
                    {\@committeeEtitle} \@committeeEname \\
                }{
                }
            }{
            }
        }{
        }
        \iftoggle{advisors}{
            \vspace{\sigpagespacing}
            \rule{3.5in}{0.4pt} \\
            {\@advisorAtitle} {\@advisorAname}, Co-Chair \\
            \vspace{\sigpagespacing}
            \rule{3.5in}{0.4pt} \\
            {\@advisorBtitle} {\@advisorBname}, Co-Chair \\
        }{
            \vspace{\sigpagespacing}
            \rule{3.5in}{0.4pt} \\
            {\@advisortitle} {\@advisorname}, Chair \\
        }
        \vspace{\sigpagespacingdate}
        {\@signmonth}~{\@signyear}
        \end{center}
    }
    \vfill
    \null
    \newpage
}

% Make the copyright page
\newcommand{\makecopyright}{
    \null
    \vspace{0.75in}
    {\doublespacing
    \begin{center}
    {\@title} \\
    \vspace{0.75in}
    Copyright {\textcopyright} {\@gradyear} \\
    by \\
    \@author
    \end{center}
    }
    \vfill
    \null
    \newpage
}

% Make the dedication page
\newcommand{\makededication}{
    \null
    {\@dedication}
    \null
    \clearpage
}

% Make the acknowledgements page
\newcommand{\makeacknowledgements}{
    \null
    \begin{center}
    \textbf{\large Acknowledgements}
    \end{center}
    {\@acknowledgements}
    \vfill
    \clearpage
}

% Make the CV page
\newcommand{\makecv}{
    \null
    {\@cv}
    \vfill
    \clearpage
}

% Make the Abstract
\newcommand{\makeabstract}{
    \null
    {\doublespacing
    \begin{center}
    \textbf{Abstract} \\
    \vspace{1cm}
    {\@title} \\ by \\ {\@author} \\
    \end{center}
    }
    {\@abstract}
    \vfill
    \clearpage
}

% Fix frontmatter, mainmatter, and backmatter
\renewcommand{\frontmatter}{
    \clearpage
    \pagenumbering{roman}
    \pagestyle{fancyfront}
}
\renewcommand{\mainmatter}{
    \clearpage
    \pagenumbering{arabic}
    \pagestyle{fancymain}
}
\renewcommand{\backmatter}{
    \clearpage
    \pagestyle{fancyback}
}

% This looks good for right now but I have not checked to see
% if it breaks \[ \] or \( \) or anything like that.

\ifprettymath
    \BeforeBeginEnvironment{equation}{\begin{singlespace}}
    \AfterEndEnvironment{equation}{\end{singlespace}\noindent\ignorespaces}
    \BeforeBeginEnvironment{equation*}{\begin{singlespace}}
    \AfterEndEnvironment{equation*}{\end{singlespace}\noindent\ignorespaces}
    \BeforeBeginEnvironment{align}{\begin{singlespace}}
    \AfterEndEnvironment{align}{\end{singlespace}\noindent\ignorespaces}
    \BeforeBeginEnvironment{align*}{\begin{singlespace}}
    \AfterEndEnvironment{align*}{\end{singlespace}\noindent\ignorespaces}
    \BeforeBeginEnvironment{gather}{\begin{singlespace}}
    \AfterEndEnvironment{gather}{\end{singlespace}\noindent\ignorespaces}
    \BeforeBeginEnvironment{gather*}{\begin{singlespace}}
    \AfterEndEnvironment{gather*}{\end{singlespace}\noindent\ignorespaces}
\fi


\endinput
