% Christopher H. Gorman
% Initial Version: 1 December 2017
%
% This class is designed to fulfill all of the requirements
% for the University of California, Santa Barbara
% dissertation requirements for 2018--2019 academic year.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucsbthesis}[2023/04/07 UCSB Thesis Class]

% Class Options

% Font size:
%       12pt is required for for submssion
\DeclareOption{10pt}{
    \PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{11pt}{
    \PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{12pt}{
    \PassOptionsToClass{\CurrentOption}{book}
}

% Paper size:
%       letterpaper is required for submission
\DeclareOption{letterpaper}{
    \PassOptionsToPackage{\CurrentOption}{geometry}
}
\DeclareOption{a4paper}{
    \PassOptionsToPackage{\CurrentOption}{geometry}
}

% Formatting:
%       proper is required for submission;
%           this option ensures the proper formatting
%       pretty makes for a more pleasing when writing;
%           this option is closer to standard LaTeX.
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

% Formatting math:
%       prettymath ensures single spacing for math equations;
%       this leads to a more pleasing result.
\newif\ifprettymath
\prettymathfalse
\DeclareOption{prettymath}{
    \prettymathtrue
}

% Option for Co-Advisors:
%       use when there are two advisors
\newif\ifadvisors
\advisorsfalse
\DeclareOption{advisors}{
    \advisorstrue
}

% Option for the number of Committee Members:
%       The standard number of committee members is assumed to be two;
%       for more members use the options below.
%       Note that this does not include the advisor or co-advisors.
%
%       members3: committee with 3 at-large members
%       members4: committee with 4 at-large members
%       members5: committee with 5 at-large members
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

% Specify Header and Footer information for Front, Main, and Back
\fancypagestyle{fancyfront}{
    % Header and footer information for front matter
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \cfoot{\thepage}
}
\fancypagestyle{fancymain}{
    % Header and footer information for main matter
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \cfoot{\thepage}
}
\fancypagestyle{fancyback}{
    % Header and footer information for back matter
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \cfoot{\thepage}
}


% Specific commands used within the class file

% Degree Objective:
%       Degree Name        (Doctor of Philosophy, Master of Arts, or
%                           Master of Science)
%       Degree Thesis Name (Dissertation or Thesis)
%       Degree Major
\newcommand{\degreeobjective}[3]{\gdef\@degreename{#1}
                                  \gdef\@degreethesisname{#2}
                                  \gdef\@major{#3}}

% Advisor Commands:
%       advisor
%
%       advisorA
%       advisorB
\iftoggle{advisors}{
    \newcommand{\advisorA}[2]{\gdef\@advisorAname{#1}
                              \gdef\@advisorAtitle{#2}}
    \newcommand{\advisorB}[2]{\gdef\@advisorBname{#1}
                              \gdef\@advisorBtitle{#2}}
}{
    \newcommand{\advisor}[2]{\gdef\@advisorname{#1}
                              \gdef\@advisortitle{#2}}
}

% Committee Commands:
%       committeeA
%       committeeB
%
%   If additional committee members are specified,
%   then the following options are used:
%
%       committeeC
%       committeeD
%       committeeE
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

% Graduation Date:
%       Grad Month
%               December for Fall
%               March for Winter
%               June for Spring
%               September for Summer
%       Grad Year
\newcommand{\graduationdate}[2]{
    \gdef\@gradmonth{#1}
    \gdef\@gradyear{#2}}
% Committee Sign Date:
%       this may be different than Graduation Date
\newcommand{\committeesignsdate}[2]{
    \gdef\@signmonth{#1}
    \gdef\@signyear{#2}}
% Dedication: specifies the dedication
\newcommand{\dedication}[1]{
    \gdef\@dedication{#1}}
% Acknowledgements: specifies the acknowledgements
\newcommand{\acknowledgements}[1]{
    \gdef\@acknowledgements{#1}}
% CV: specifies the CV
\newcommand{\cv}[1]{
    \gdef\@cv{#1}}
% Abstract: specifies the abstract
\newcommand{\abstract}[1]{
    \gdef\@abstract{#1}}

% Specify the Title page length
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

% Specify the Signature page length
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
