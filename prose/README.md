These are example templates that demonstrate different usage of LaTeX and RMarkdown in linguistic papers, with specific focus to the needs of linguists working on Uralic languages.

## XeLaTeX

From Terminal it is possible to compile the document with following commands:

    xelatex langdoc-tex.tex
    biber langdoc-tex
    xelatex langdoc-tex.tex
    xelatex langdoc-tex.tex

Since the compilation with bibliography is little bit complicated, it could maybe be possible to have a screenshots or small GIF here about that.

## RMarkdown

RMarkdown can be compiled by opening the Rmd file in RStudio and clicking the button **Knit**. 

From Terminal one can also just start R and run following lines. Only the last one is truly necessary, but package `rmarkdown` has to be installed.

    R
    if (!rmarkdown %in% installed.packages()) install.packages('rmarkdown')
    rmarkdown::render('output_file.Rmd')
