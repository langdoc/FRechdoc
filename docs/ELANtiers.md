# ELAN Tiers

This page documents the ELAN tier structures used by our projects. Adherance to these structures is necessary to use the [annotation engine scripts](Engine.md) which automatically tokenize and add morphosyntactic annotations.

## ELAN Linguistic Types

Mandatory types:

|Name     |Stereotype          |Purpose|
|--------:|:-------------------|:------|
|refT     |n.a.                |for ref-tiers; no stereotype, independent and time-alignable root nodes| 
|orthT    |symbolic association|for orth-tiers, exact time-aligned copy of superordinate ref-tier|
|ft-(<…>)T|symbolic association|for ft-tiers into multiple languages (defined with <…>), overall time-aligned copy of the orth-tier (and thus ref-tier)|
|wordT    |symbolic subdivision|for word-tiers, overall time-aligned copy of orth-tier (and thus ref-tier), but able to be divided into multiple equal parts|
|lemmaT   |symbolic subdivision|for lemma-tiers, overall equally-spaced, time-aligned copy of the word-tier, but able to be divided into multiple equal parts|
|posT     |symbolic subdivision|for pos-tiers, overall equally-spaced, time-aligned copy of the word-tier, but able to be divided into multiple equal parts|
|morphT   |symbolic subdivision|for morph-tiers, overall equally-spaced, time-aligned copy of the word-tier, but able to be divided into multiple equal parts|

Additional types can be used for project specific uses. Examples for additional types are:

|Name          |Stereotype          |Purpose|
|-------------:|:-------------------|:------|
|orth-origT    |symbolic association||
|ft-(<…>)-origT|symbolic association||
|word-goldT    |symbolic subdivision||
|lemma-goldT   |symbolic subdivision||
|pos-goldT     |symbolic subdivision||
|morph-goldT   |symbolic subdivision||


Definitions and specifications are unsolved for the following types:

|Name  |Stereotype          |Purpose|Note|
|-----:|:-------------------|:------|----|
|noteT |symbolic association|for tiers adding notes to a given parent tier, overall time-aligned copy of the parent-tier|can be non-tier specific?|
|langT |symbolic ??         |for lang-tier to indicate language(s) being used in the corresponding utterance|lang indication can potential occur relevant for an utterance/sentence and word| 
|synthT|symbolic ??         |for synth-tiers, overall equally-spaced, time-aligned copy of the word-tier, but able to be divided into multiple equal parts| |

##ELAN Tiers and Tier Hierarchy

Minimally required for each speaker:

|Level|Name |Parent Tier |Linguistic Type|Purpose|
|----:|-----|------------|--------------:|:------|
|0    |ref  |n.a.        | refT          |root node, time-aligned annotation units, each provided with a unique number here |
|-1   |orth |ref         | orthT         |orthographic transcription; this provides the input for the annotation engine |

Optional for each speaker:

|Level|Name    |Parent Tier|Linguistic Type|Purpose|
|----:|--------|-----------|--------------:|:------|
|-2   |ft-(<…>)|orth       | ftT           |free translation of the annotated text; XYZ is replaced with a language code (e.g. eng, rus, etc.); can occur multiple times for multiple lingua francas |
|-2   |lang    |orth       | langT         |indicates the language being used in an annotated utterance or part of an annotated utterance; the language name is in English; adheres to 'languages'-list of controlled vocabulary |

Optional for any tier or as a root node with its own time-alignment:

|Level|Name      |Parent Tier|Linguistic Type|Purpose|
|----:|----------|-----------|--------------:|:------|
|''*''|note-(<…>)|(<…>)      | noteT         |provide unstructured text-based notes for any given parent tier specified with <…> |

These tiers are created automatically by the annotation engine with the result that existing annotations are overwritten each time the engine runs. Therefore, these tiers can not have other dependent tiers.

|Level|Name |Parent Tier |Linguistic Type|Purpose|
|----:|-----|------------|--------------:|:------|
|-2   |word |orth        | wordT         |preprocessed-tokenized version of the orth-tier; automatically created by the annotation engine |
|-3   |lemma|word        | lemmaT        |lemma (or lemmata in case of ambiguities) for word form listed in parent tier; automatically created by the annotation engine |
|-3   |morph|word        | morphT        |morphological category (or categories in case of ambiguities) for word form listed in parent tier; automatically created by the annotation engine |
|-3   |pos  |word        | posT          |part of speech (or parts of speech in case of ambiguities) for word form listed in parent tier; automatically created by the annotation engine |

## General Rules

- all tiers for a given speaker are named using the tier name plus the @ symbol plus an short form referring to the relevant speaker, such as ref@JKW, lemma@JKW
- Each ref annotation must have content and it has to be unique
- Each tier must have participant, uniquely identified after @ in tier name; standard for naming participants can be project-specific
- These tiers must have a language specified in the attribute: orth, word, lemma, ft-(<…>), note-(<…>)

## ELAN Tier Template Files for Download

Template files (in ELAN .etf format):

- For spoken corpus data
    - [Master template|ELAN/ELAN_spoken_template.etf] (including all possible - annotation tiers and linguistic types)
    - [PSDP template|ELAN/ELAN_spoken_template_PSDP.etf] (including only annotation tiers and linguistic types relevant for PSDP)
    - KSDP template (including only annotation tiers and linguistic types relevant for KSDP
    - IKDP template (including only annotation tiers and linguistic types relevant for IKDP
- For written corpus data
    - Master template (including all possible annotation tiers and linguistic types)
    - PSDP template (including only annotation tiers and linguistic types relevant for PSDP)
    - KSDP template (including only annotation tiers and linguistic types relevant for KSDP
    - IKDP template (including only annotation tiers and linguistic types relevant for IKDP


## Unsolved questions and other things to do

- To add orig-convention to places where it is needed
- To come up with some solution to resolve note-tiers
- Ref tier pattern: .0024?
- Translation-tiers where ‘lang’ is replaced with specific language (eng=english, deu=deutsch -- use ISO-codes?); can have multiple derivations. Should we shift to Glottocodes in some point?
