These are example templates that demonstrate different usage of LaTeX and RMarkdown in linguistic papers, with specific focus to the needs of linguists working on Uralic languages. The main issues are:

- The need to manage citations is probably not more complex than on other scientific fields, but on the other hand there is need to cite different digital resources, and the sources come in many different languages
- XeLaTeX has to be used as it can take care of more complex characters we need in glosses and elsewhere

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
    rmarkdown::render('langdoc-rmd.Rmd')

## Tasks

- Description of tables
- Description of adding images
- Description of using footnotes
- Explanation on document language settings
- Explanation on custom hyphenation

## How to contribute

Just fork the repository and contribute! It is possible to discuss more complex ideas in issues. For example, if someone has very wild ideas it may be good to have one very basic version and then another which gets more fancy and experimental. Just add your name into authors of relevant documents, and if your text is copied there, then your name will be added.
