## Scripts for film reuse

These scripts are written for quite specific use, and it is unclear how easy it is to customize them into new uses, but in principle they deal with very ordinary use cases and could be useful. The logic should be such that reimplementing it in some other programmic languages should be easy as well.

### get_annotation_lengths.R

All R packages needed to run this package can be installed with command:

    install.packages('tidyverse')

The script can be run from Terminal with command:

    Rscript get_annotation_lengths.R path/to/the/elan_file.eaf

It should return something like this:

    [1] "Segments with annotations: 16M 49.467S"
    [1] "Segments with English translations: 12M 48.074S"
    [1] "Segments with no Cyrillic characters: 16M 40.542S"
    [1] "Segments which contain Cyrillic characters: 8.925S"