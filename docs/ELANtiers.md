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

##ELAN Tiers and Tier Hierarchy

Required for each speaker:

|Level| Name    | Parent Tier | Linguistic Type | Purpose |
|----:|---------|-------------|-----------------|---------|
|0    | ref     | -           | refT            | root node, time-aligned annotation units, each provided with a unique number here |
|-1   | orth    | ref         | orthT           | orthographic transcription; this provides the input for the FST engine |
|-2   | word    | orth        | wordT           | preprocessed-tokenized version of the orth-tier; automatically created by the FST engine |
|-3   | lemma   | word        | lemmaT          | lemma (or lemmata in case of ambiguities) for word form listed in parent tier; automatically created by the FST engine |
|-3   | morph   | word        | morphT          | morphological category (or categories in case of ambiguities) for word form listed in parent tier; automatically created by the FST engine |
|-3   | pos     | word        | posT            | part of speech (or parts of speech in case of ambiguities) for word form listed in parent tier; automatically created by the FST engine |

Optional for each speaker:

|Level| Name    | Parent Tier | Linguistic Type | Purpose |
|----:|---------|-------------|-----------------|---------|
|-2   | ft-(<…>)| orth        | ftT             | free translation of the annotated text; XYZ is replaced with a language code (e.g. eng, rus, etc.); can occur multiple times for multiple lingua francas |
|-2   |  lang   | orth        | langT           | indicates the language being used in an annotated utterance or part of an annotated utterance; the language name is in English; adheres to 'languages'-list of controlled vocabulary |

Optional for any tier or as a root node with its own time-alignment:

|Level||  Name  | Parent Tier | Linguistic Type | Purpose |
|----:|---------|-------------|-----------------|---------|
|''*''| note-XYZ| XYZ         | noteT           | provide unstructured text-based notes for any given parent tier XYZ |

*all tiers for a given speaker are named using the tier name plus the @ symbol plus an short form referring to the relevant speaker, such as ref@JKW, lemma@JKW

##ELAN Tier Template Files for Download

Template files (in ELAN .etf format):

* For spoken corpus data
 * [Master template|ELAN/ELAN_spoken_template.etf] (including all possible annotation tiers and linguistic types)
 * [PSDP template|ELAN/ELAN_spoken_template_PSDP.etf] (including only annotation tiers and linguistic types relevant for PSDP)
 * KSDP template (including only annotation tiers and linguistic types relevant for KSDP
 * IKDP template (including only annotation tiers and linguistic types relevant for IKDP
*For written corpus data
 * Master template (including all possible annotation tiers and linguistic types)
 * PSDP template (including only annotation tiers and linguistic types relevant for PSDP)
 * KSDP template (including only annotation tiers and linguistic types relevant for KSDP
 * IKDP template (including only annotation tiers and linguistic types relevant for IKDP

- reference-tier
    - Purpose: Uniquely identifies annotation (utterance for a speaker); pattern: .0024?
    - Name: ref@participant
    - Type: refT
    - Stereotype: time-aligned
    - Obligatory: yes
    - Parent: root
- orthography-tier
    - Purpose: Standard orthography; input for FST-script
    - Name: orth@participant
    - Type: orthT
    - Stereotype: symb.-assoc.
    - Obligatory: yes
    - Parent: refT
- word-tier
    - Purpose: Wordform; Extracted by FST-script; input for FST 
    - Name: word@participant
    - Type: wordT
    - Stereotype: symb.-subdiv.
    - Obligatory: yes
    - Parent: orthT
- lemma-tier
    - Purpose: Lists lemma/possible lemmas; output from FST
    - Name: lemma@participant
    - Type: lemmaT
    - Stereotype: symb.-subdiv.
    - Obligatory: yes
    - Parent: wordT
- morph-tier
    - Purpose: output from FST
    - Name: morph@participant
    - Type: morphT
    - Stereotype: symb.-subdiv.
    - Obligatory: yes
    - Parent: wordT
- pos-tier
    - Purpose: output from FST
    - Name: pos@participant
    - Type: posT
    - Stereotype: symb.-subdiv.
    - Obligatory: yes
    - Parent: posT
- translation-tiers
    - Purpose: Free translation of orth; ‘lang’ is replaced with specific language (eng=english, deu=deutsch -- use ISO-codes?); can have multiple derivations. Should we shift to Glottocodes in some point?
    - Name: ft-lang@participant
    - Type: ft-langT
    - Strereotype: symb.-assoc.
    - Obligatory: no
    - Parent: orthT

### Rules

- Each ref annotation must have content and it has to be unique
- Each tier must have participant, uniquely identified after @ in tier name; standard for naming participant can be project-specific
- These tiers must have language specified in the attribute: orthT, ft-serie

### Things to do

To add orig-convention to places where it is needed
To come up with some solution to resolve note-tiers, for example three types assigned to currently existing (check this) notes:

- note-refT
- note-orthT
- note-wordT
