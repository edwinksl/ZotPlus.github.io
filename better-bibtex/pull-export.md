---
title: Push/Pull Export
---

# Push Export

When exporting using Better Bib(La)Tex you will be offered a new export option: Keep Updated. Checking this option
registers the export for automation; any changes to the collection after you've completed the current export will trigger an automatic re-export to update the bib file. You can review/remove exports from the BBT preferences.
While I've gone to some lengths to make sure performance is OK, don't go overboard with the number of auto-exports you
have going.

# Pull Export
You can fetch your library as part of your build, using curl (for example by using the included zoterobib.yaml arara
rule), or with a BiblaTeX remote statement like
\addbibresource[location=remote]{http://localhost:23119/better-bibtex/collection?/0/8CV58ZVD.biblatex}.  For Zotero
standalone this is enabled by default; for Zotero embedded, you need to enable the embedded webserver from the BBT
preferences screen (see below). You can then fetch your bibliography on the url
http://localhost:23119/better-bibtex/collection?[collectionID].[format], where collectionID is:

* the ID you get by right-clicking your collection and selecting "Show collection key"
* the path "/[library id]/full/path/to/collection" (the library id is the first number from the key you get in the
  option above; it's always '0' for your personal library)

or any multiple of those, separated by a '+' sign.

The format is either 'bibtex' or 'biblatex', and determines the translator used for export.

You can add options to the export as URL parameters:

* `&exportCharset=<charset>`
* `&exportNotes=[true|false]`
* `&useJournalAbbreviation=[true|false]`

Zotero needs to be running and the [embedded server needs to be enabled](customized-exports.html) for this to work.

# Recursive collection export

The pull export will export child collections when the [recursive option](customized-exports.html) is enabled.
