# UCSB-Dissertation-Template

This document describes all of the files for a doctoral dissertation
as required by UCSB.
The template can also be used when writing a master's thesis.
`ucsbthesis.cls` is based on the standard LaTeX book class `book.cls`.
Because of this, most if not all options available in the book
class are available in `ucsbthesis.cls`.
This class allowed the class author to graduate in June 2019
(using Mid 2009 Macbook Pro, OS X El Capitan (10.11.6)).

Others should be able to use this package as well;
however, one other student (fellow math PhD student) had issues
with the margins, even though we used the **exact same** class file.
We were never able to figure out what was causing the difference,
although he was running a GNU/Linux system, not Mac OS X.
Because of this, it may be necessary to change some of the margins
manually, but that will (hopefully) be the only necessary change.
To do this, look at the `geometry` package.

## Commands with Examples

Here are some of the specific commands that are **required**
along with examples.
Most of the definitions are defined in `preamble.tex`,
which then loads commands and packages.

 *  Author:

    `\author{Christopher Henry Gorman}`

    The candidate writing the dissertation or thesis.
    Full legal name (first, middle, last) is
    acceptable as well as first name, middle initial, last name.


 *  Title:

    `\title{Applications of the Minimum Sobolev Norm
        and Associated Fast Algorithms}`

    The title of the candidate's dissertation or thesis.


 *  Graduation Data:

    `\graduationdate{June}{2019}`

    The month and year the degree will be awarded:
    June for Spring Quarter;
    September for Summer Quarter;
    December for Fall Quarter;
    March for Winter Quarter.


 *  Signature Date:

    `\committeesignsdate{May}{2019}`

    The month and year the committee signs the signature page.
    This could be different from `\graduationdate{}{}` if, for instance,
    one defends in May and graduates in June.

    From the 2018-19 Guide to Formatting and Filing Theses, Dissertations,
    and DMA Supporting Documents, Page 5, under Signature Page:

    The signature page must include the month and year that the
    committee signs, indicating their approval and acceptance of
    the entire document.


 *  Degree Objective

    `\degreeobjective{Doctor of Philosophy}{Dissertation}{Mathematics}`

    `\degreeobjective{Master of Arts}{Thesis}{Mathematics}`

    For PhD students, one should use the above example while
    changing the major (Mathematics) as needed.
    For masters students, use ''Master of Arts'' or
    ''Master of Science'' depending on your degree.
    ''Dissertation'' applies to PhD students while ''Thesis''
    applies to masters students.


 *  Advisor/Co-Advisors:

    `\advisor{Shivkumar Chandrasekaran}{Professor}`

    Advisor of candidate. ``Professor'' is included for all professors,
    regardless of rank.
    
    `\advisorA{Shivkumar Chandrasekaran}{Professor}`

    `\advisorB{Xu Yang}{Professor}`

    In order to have co-advisors, you must include `advisors`
    as an class option. Note the command differences:
    `\advisor` versus `\advisorA` and `\advisorB`.


 *  Committee Members:

    `\committeeA{Hector Ceniceros}{Professor}`

    `\committeeB{Xiaoye Sherry Li}{Dr.}`

    Regular committee members. In this example, ''Dr.'' is included
    for title because Sherry Li is not a professor at UCSB although
    she has earned a doctorate.
    See regulations for the non-academic case.


 *  Additional Committee members (optional):

    `\committeeC{John Gilbert}{Professor}`

    `\committeeD{Mihai Putinar}{Professor}`

    `\committeeE{Hrushikesh Mhaskar}{Professor}`

    Additional committee members (more than usual).
    Must use the option
    `members3` for `\committeeC` command;
    `members4` for the `\committeeC` and `\committeeD` commands; and
    `members5` for the `\committeeC`, `\committeeD`, and `\committeeE`
    commands.
    

 *  Dedication/Acknowledgements/Abstract/CV (optional):

    `\dedication{\input{tex/dedication.tex}}`

    `\acknowledgements{\input{tex/acknowledgements.tex}}`

    `\abstract{\input{tex/abstract.tex}}`

    `\cv{\input{tex/cv.tex}}`

    Include text (or a text file) for the dedication, acknowledgements,
    abstract, and cv.
    Only the text of the abstract is needed, as the
    formatting is taken care of by the appropriate command (see below).
    It is possible to take a CV from a PDF and include it into
    the dissertation/thesis; look at the `pdfpages` package
    and the `\includepdf{}` command.
    A CV is **required** for doctoral candidates.


 *  Make Title and other pages:

    `\maketitle`

    `\makesignature`

    `\makecopyright`

    `\makededication`

    `\makeacknowledgements`

    `\makecv`

    `\makeabstract`

    These commands make exactly what they describe:
    title page, signature page, copyright page, dedication page,
    acknowledgements page, cv, and abstract.
    The order of these commands do not necessarily need to be in
    this order but the title page **must** be first followed by
    the signature page.


 *  Table of Contents and related

    `\tableofcontents`

    `\listoffigures`

    `\listoftables`

    These commands (standard `book.cls` commands) create a table
    of contents, a list of figures, and a list of tables.
    It is possible to create other lists as needed.


## Class Options

We describe the main options of this class.
This class first loads `book.cls` and passes the `letterpaper`
and `12pt` options.
This means that we assume letter paper, 12pt font, and all of the
options standard with the book class. Most importantly, this means
that `proper` **must** be passed for the doublespacing and
correct formmatting (correct formatting for the 2018--2019 academic year).

 *  `10pt`, `11pt`, `12pt`

    Font options for dissertation or thesis.
    Note that 12pt is **required** and is automatically loaded.

 *  `letterpaper`, `a4paper`

    Size of document. Note that `letterpaper` is **required**
    and automatically loaded.

 *  `proper`

    Causes output to have the correct margins (1.25in left margins,
    all other 1in), doublespacing, and one-sided printing
    (no even/odd-ness like books).
    This was **required** for the 2018--2019 academic year.
    Note that `proper` and `pretty` are mutually exclusive options.

 *  `pretty`

    Causes output to be 1in all around and singlespacing (looks much
    better). This was deemed easier-on-the-eyes or ``pretty''
    by the class author.
    Note that `proper` and `pretty` are mutually exclusive options.

 *  `prettymath`

    This causes all equation, align, and gather environments (as well
    as their `*` versions) to be printed singlespaced instead of
    doublespaced (very important for matrices). As the name implies,
    it makes the math pretty; that is, the math appears like it would
    in a standard singlespaced LaTeX document, as well as allows
    display math the break over pages (important in some situations).
    
    Note: the class author has **not** checked to see if the above changes
    also work for `\[ \]`, `\( \)`, or other math environments.

 *  `advisors`

    This option allows for for co-advisors. Instead of the `\advisor`
    command, use instead the `\advisorA` and `\advisorB` commands.

 *  `members3`, `members4`, `members5`

    Allow for either 3, 4, or 5 non-advisor committee members.
    Naturally,
    `members3` requires `\committeeC`;
    `members4` requires `\committeeC` and `\committeeD`; and
    `members5` requires `\committeeC`, `\committeeD`, and `\committeeE`.


## Bibliography 

As currently written, this document uses the `biblatex`
package for its bibliography.
Other packages can be used, but you will need to 
change the appropriate lines of `phd_thesis.tex` to do so.


## Note on advisors and committee members:

Co-advisors and up to 5 non-advisor committee members seemed
like the most common and would appear to cover almost everyone.
If for some reason this does not apply to your doctoral committee,
please feel free to make the necessary changes to the class yourself.
I think you have way too many people on your committee,
but that is not my problem.

Good luck.
