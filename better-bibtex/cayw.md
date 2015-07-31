---
title: Cite As You Write
---
# Cite as you Write for text-based editors

Good news for TeXnicians and those down with Mark (aka Markdown, RST, whatnot): this is the time to go pester the author
of your favorite editor for Zotero integration! This is hot off the press, so there *will* be bugs. Here's how it works:

BBT now exposes (if you have HTTP export on in the preferences) an URL at http://localhost:23119/better-bibtex/cayw. The url accepts
the following URL parameters:

* `citeprefix`, default empty, for text to put before the full citation.
* `citepostfix`, default empty, for text to put after the full citation.
* `keyprefix`, default empty, for text to put before each individual citekey
* `keypostfix`, default empty, for text to put after each individual citekey
* `separator`, default `,`, for text to put between citekeys
* `clipboard`, default empty, where any non-empty value will copy the results to the clipboard

So if you call up
[http://localhost:23119/better-bibtex/cayw?keyprefix=%40&citeprefix=%5B&citepostfix=%5D&clipboard=yes](http://localhost:23119/better-bibtex/cayw?keyprefix=%40&citeprefix=%5B&citepostfix=%5D&clipboard=yes), the Zotero citation picker will pop up. If you then select two references that happen to have cite keys `adams2001` and `brigge2002`, then

* the response body will be `[@adams2001,brigge2002]`, and
* `[@adams2001,brigge2002]` will be left on the clipboard

The first option is for editor authors, as it will allow them to paste the results right into the editor. The second you
will probably want to bind to a hotkey, either system-wide (which is going to be platform-dependent, I know
[AutoHotKey](http://www.autohotkey.com) works for windows, for OSX [Karabiner](https://pqrs.org/osx/karabiner/) ought to
do the job, and for Linux you could give [IronAHK](https://github.com/polyethene/IronAHK) or
[autokey](https://code.google.com/p/autokey/) a shot), or application-specific (I know Cmd-Y works for Scrivener on
OSX, haven't tried anything else yet).

## Scrivener 2.0 for Mac

### Picking references

Put the following in a text file and make it executable:

```
#!/bin/bash

curl -o /dev/null http://localhost:23119/better-bibtex/cayw?keyprefix=@&clipboard=yes
```

then configure Scrivener to call this script as your bibliography command (cmd-Y)

### Pandoc

Install `Mac Installer 4.7.1` and `Mac Support` from the [MultiMarkdown](http://fletcherpenney.net/multimarkdown/download/) site

Move `~/Library/Application Support/MultiMarkdown/bin/mmd-xslt` to `~/Library/Application Support/MultiMarkdown/bin/mmd-xslt.bak`.

Install [ZoTXT](https://bitbucket.org/egh/zotxt), both the Zotero extension and the command line script.

Create a new file `~/Library/Application Support/MultiMarkdown/bin/mmd-xslt`, with the following contents:
```
#!/bin/bash
pandoc -F pandoc-zotxt -F pandoc-citeproc --from markdown --to html
```

In Scrivener, in the compile dialog, `MultiMarkdown -> Web Page (.html)`, select `All Options`, and under
`Compatibility`, select `Use XSLT post-processing`.
