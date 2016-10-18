### Tools

#### ELAN

Used in transcriptions, see the [documentation](https://langdoc.github.io/FRechdoc/elan.html).

#### LAMUS 2

We have been testing this and it seems to be very usable.

#### OCRicola / Tesseract

Used in OCR tasks.

#### bib2bib

Note: Google around for some links. This tool can be used to extract a portion of a bibliography into a new bibtex file. This can be convenient, for example, in order to share a subset of a large bibliography with someone. Or the main bibliography can contain some problems which make different tools choke into it, but the small subset one needs for whatever smaller use can still be perfectly formatted. Of course all changes have to be done to the main bibliography, but this subset can be recreated just before whatever work in hand is compiled.

##### use

- Niko uses this for all kind of random stuff he does.
- Could be useful to subset the bibliography containing entries for sessions. For example, someone uses a subset of the corpus for study X, and for that purpose one needs to be able to refer into those sessions within the selection, not the the whole thing.

##### example of use

    #!/bin/bash 
    bib2bib -oc /Users/me/language_shift-citations -ob /Users/me/language_shift.bib -c 'keywords : "language shift" or
    keywords : "language death" or
    keywords : "endangered languages" or
    keywords : "language revitalization" or
    keywords : "language maintenance"' bibliography.bib

The syntax is bit strange, but first file it creates is just list of all keys taken (probably can be somehow omitted). Then one points to the bibliography that should be created. Then one lists what is used to filter. That's it!

#### hunalign – sentence aligner

http://mokk.bme.hu/en/resources/hunalign/

A tool for automatically matching sentence pairs in translated texts.

###### use

- Aligning Eric Vászolyi's transcriptions and translations
- Aligning Eliel Lagercrantz’ transcriptions and translations (sje and sms)
