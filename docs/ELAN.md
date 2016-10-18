### Freiburg ELAN template documentation


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
