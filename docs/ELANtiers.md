#ELAN Tiers

This page documents the ELAN tier structures used by our projects. Adherance to these structures is necessary to use the ELAN-FST script which automatically adds annotations on word, lemma, morphological categories and part of speech.


##ELAN Linguistic Types (required)

| Name      | Stereotype           | Purpose                                                                                           |
|----------:|----------------------|-------------------------------------------------------------------------------------------------------------------------------|
| refT      | -                    | for ref-tiers; no stereotype, independent and time-alignable root nodes | 
| orthT     | symbolic association | for orth-tiers, exact time-aligned copy of superordinate ref-tier |
| wordT     | symbolic subdivision | for word-tiers, overall time-aligned copy of orth-tier (and thus ref-tier), but able to be divided into multiple equal parts |
| lemmaT    | symbolic subdivision | for lemma-tiers, overall equally-spaced, time-aligned copy of the word-tier, but able to be divided into multiple equal parts |
| morphT    | symbolic subdivision | for morph-tiers, overall equally-spaced, time-aligned copy of the word-tier, but able to be divided into multiple equal parts |
| posT      | symbolic subdivision | for pos-tiers, overall equally-spaced, time-aligned copy of the word-tier, but able to be divided into multiple equal parts |
| ft-(<…>)T | symbolic association | for ft-tiers into multiple languages, overall time-aligned copy of the orth-tier (and thus ref-tier) |

##ELAN Linguistic Types (additional)

| Name  | Stereotype           | Purpose                                                                                           |
|------:|----------------------|---------------------------------------------------------------------------------------------------|
| noteT | symbolic association | used for tiers adding notes to a given parent tiers, overall time-aligned copy of the parent-tier |
| langT | symbolic subdivision | used for lang-tier to indicate language(s) being used in the utterance |


