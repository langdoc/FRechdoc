---
title: ELAN documentation
---

This page documents conventions, standards and relevant workflows used for ELAN annotations created by [The Freiburg Research Group in Saami Studies](http://www.skandinavistik.uni-freiburg.de/institut/forschung/forschungsprojekte/saami) in collaboration with other partners.

#### ELAN

ELAN is a GUI tool for the creation of annotations on video and audio resources. It is used by many documentary linguists and several language documentation projects, e.g. in [DOBES](http://dobes.mpi.nl), [HRELP](http://www.hrelp.org) and other similar programs.

The program allows for complex corpus searches using RegEx, multi-tier and multi-corpus (i.e. across several ELAN-files) data as well as visualization of search results (concordance, frequency, etc.). For ELAN-files stored at [The Language Archive (TLA)](TLA.md), these features work also with the online tool [Trova](http://tla.mpi.nl/tools/tla-tools/trova/).

We use ELAN for transcribing and translating our video and audio ressources stored at TLA as well as for annoting and presenting our purely written text corpora (without links to multimedia). Here are the [ELAN Documentation Pages by the ELAN developers](http://tla.mpi.nl/tools/tla-tools/elan).

#### EAF

The name extension for ELAN files is __.eaf__. These are basically XML files (and can be opened as such), but they can also be read by the program ELAN for beeing presented and further edited in a GUI.

#### General Workflow

Current praxis

- Raw audio/video data is stored at [TLA](TLA.md)
- Orthographic transcription is done in ELAN
- Translation into at least one main lingua franca (e.g. Swedish for Pite Saami, Russian for Komi, etc.) is done in ELAN
- Occasionally, more (deeper) annotations are created manually, e.g. pos-tagging

Planned extension using the Giellatekno toolkit 

- Preprocessing-tokenizing
- Morphological analyzis using the FST tool
- Disambiguation using the CG tool
- Back-importing lemmatized/pos-tagged/glossed wordforms into the corresponding [ELAN tiers](ELANtiers.md). 

#### Annotation Conventions

ELAN

- Documentation page for the [ELAN tier structures used by our projects](ELANtiers.md), incl. links to ELAN tier template files (XML file in ELAN's own .etf-format)
- Documentation page for [Transcription conventions](Transcription.md) applied by our projects

#### Related tools

- [WebLicht](http://de.clarin.eu/de/sprachressourcen/weblicht/), a web-based tool to semi-automatically annotate texts for linguistics and humanities research. Interaction with WebLicht from ELAN is still only under development
