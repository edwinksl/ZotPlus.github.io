---
title: Cite As You Write
---
# Cite as you Write for text-based editors

Good news for TeXnicians and those down with Mark (aka Markdown, RST, whatnot): this is the time to go pester the author
of your favorite editor for Zotero integration! This is hot off the press, so there *will* be bugs. Here's how it works:

BBT now exposes (if you have HTTP export on in the preferences) an URL at http://localhost:23119/better-bibtex/cayw. The url accepts
the following URL parameters:

* `format`, default empty. Possible values are:
  * `mmd` for MultiMarkdown-formatted references.
  * `pandoc` for pandoc-formatted references
  * `latex` for latex-formatted references. By default it will use the `cite` command, but you can override this by
    adding a `command` parameter; alternately, you can use a format starting with `cite` for the same effect.
  * `scannable-cite` for citations formatted for [RTF/ODF-Scan for Zotero](http://zotero-odf-scan.github.io/zotero-odf-scan/)
* `clipboard`, default empty, where any non-empty value will copy the results to the clipboard

The picker allows setting of various metadata:

* `locator`, the place within the work (e.g. page number)
* `prefix`, for stuff like "see ..."
* `suffix`, for stuff after the citations
* `suppress author`, if you only want the year.

However not all formats supports these. Pandoc and scannable cite are the richest ones, supporting all 4. MultiMarkdown supports
none. LaTeX supports all 4, in a way; if you choose `suppress author` for none or all of your references in a pick, you
will get the citation as you would normally enter it, such as `\\cite{author1,author2}`, or
`\\citeyear{author1,author2}`. If you use `locator`, `prefix`, `suffix` in any one of them, or you use `suppress author`
for some but not for others, the picker will write them out all separate, like `\\cite[p.  1]{author1}\\citeyear{author2}`, 
as LaTeX doesn't seem to have a good mechanism for combined citations that mix different prefixes/suffixes/locators.

For example, if you call up [http://localhost:23119/better-bibtex/cayw?format=mmd&clipboard=yes](http://localhost:23119/better-bibtex/cayw?format=mmd&clipboard=yes), the Zotero citation picker will pop up. If you then select two references that happen to have cite keys `adams2001` and `brigge2002`, then

* the response body will be `[#adams2001][][#brigge2002][]`, and
* `[#adams2001][][#brigge2002][]` will be left on the clipboard

The `clipboard` option can be used as a workaround for editors that haven't gotten around to integrating this yet, but
for a really smooth workflow, the editor could instead call this URL on your behalf and paste the results at the
insertion point. If you use the clipboard option you
will probably want to bind to a hotkey, either system-wide (which is going to be platform-dependent, I know
[AutoHotKey](http://www.autohotkey.com) works for windows, for OSX [Karabiner](https://pqrs.org/osx/karabiner/) ought to
do the job, and for Linux you could give [IronAHK](https://github.com/polyethene/IronAHK) or
[autokey](https://code.google.com/p/autokey/) a shot), or application-specific (I know Cmd-Y works for Scrivener on
OSX, haven't tried anything else yet).

For testing for other markdown formatters, you can construct simple references yourself, using:

* `citeprefix`, default empty, for text to put before the full citation.
* `citepostfix`, default empty, for text to put after the full citation.
* `keyprefix`, default empty, for text to put before each individual citekey
* `keypostfix`, default empty, for text to put after each individual citekey
* `separator`, default `,`, for text to put between citekeys

You can see how to create customized citekey at [Citation Keys](https://zotplus.github.io/better-bibtex/citation-keys.html). In detail syntax can be found at [JabRef Syntax](http://jabref.sourceforge.net/help/LabelPatterns.php).

The citation pattern should be added in the BetterBibTex preferences.

In the picker you can use the build in options of adding page, suffix, prefix and suppress author and they will be automatically represented in the generated citation key.

When you press Enter in the picker, click on the Scrivener document you work and by Paste (cmd+V) you add the citation key in your document.

## Scrivener 2.0 for Mac

### Picking references

Download [zotpick-mmd.app](zotpick-mmd.zip) for MultiMarkdown or [zotpick-pandoc.app](zotpick-pandoc.zip) for Pandoc-Markdown. Move the extracted zotpick app in Applications and configure Scrivener to call this as your bibliography command (cmd-Y) (in Scrivener/Preferences/General/Bibliography Manager).
Before first use, double-click `zotpick-mmd.app` or `zotpick-pandoc.app`, and make sure you see no complaints from the security manager. If you get complaints go to System preferences/Security and Privacy and click open.

### Setting up Pandoc

Install `Mac Installer 4.7.1` and `Mac Support` from the [MultiMarkdown](http://fletcherpenney.net/multimarkdown/download/) site

Go to `~/Library/Application Support/MultiMarkdown/bin/mmd-xslt` and make a duplicate of `mmd-xslt`, rename it to `mmd-xslt.bak`.

[Install ZoTXT](https://bitbucket.org/egh/zotxt), both the Zotero extension and the command line script. If you can not instal it with the command line `sudo pip install pandoc-zotxt` then try with `sudo python setup.py install`. Before you execute the command make sure that in the Terminal you are in the pandoc-zotxt folder. If you download it in Downloads then the right command to go to the folder is `Cd ~/Downloads/pandoc-zotxt`

Open `~/Library/Application Support/MultiMarkdown/bin/mmd-xslt`, delete its content and add the following contents:

     #!/bin/sh
     pandoc --from markdown --to html -F pandoc-zotxt -F pandoc-citeproc --csl=/Applications/citation.csl

You can open the mmd-xslt with TextEdit.

You can pick whatever you want for the output format (passed with the `--to` parameter) as long as [pandoc supports
it](http://pandoc.org/README.html)
(Scrivener however wants the output to be written to stdout, so perhaps the
[caveat](http://pandoc.org/demo/example19/Using-pandoc.html) for some output format applies, like docx).

In Scrivener, in the compile dialog, `MultiMarkdown -> Web Page (.html)`, select `All Options`, and under
`Compatibility`, select `Use XSLT post-processing`.

### Changing citations

In order to be able to change the citations as you like you should follow this workflow.
Download the citation from [Zotero Style Repository](https://www.zotero.org/styles), rename it to `citation.csl` and place it in the folder `Applications`. Now the citation style will be automatically used.

In order to change the citation style, download the wanted citation style from Zotero Style Repository and when you save it, you save it in Applications with the name citation.csl. This overwrites the previous citation and now the new citation style will be used.

### Conversion html to docx
To convert the html to docx you need to use the Terminal (the existing GUIs make the conversion more complicate). However, because very often the html file is located somewhere in a folder that is in a folder that is in a folder (i.e. the folder where you have all your documents for the paper) and has empty spaces in the title it can be problematic to enter everything correctly in the Terminal. To minimize the possibility for mistakes the following procedure is proposed:

Open Terminal and write

* `pandoc` (leave one empty space after it)

* than go in Finder and drag your html file in the Terminal. You will get something like this `/Users/username/Desktop/My\ Beautiful\ paper.html`

* than leave empty space and write -o (also leave one empty space after it)

* than again drag and drop the same html file in the terminal. However, now you delete .html (at the end) and write .docx and press enter. Then in the same folder you should have the `My Beautiful paper.docx` appropriately formatted and with citations.

The content in the terminal should look like this:

> **pandoc** /Users/mijalce/Desktop/My\ Beautiful\ paper.html **-o** /Users/mijalce/Desktop/My\ Beautiful\ paper.**docx**

(in bold is what you write)

## Marked2
The `mmd-xslt` can be used as a Custom processors and/or Preprocessor in [Marked2](http://marked2app.com/). So in the preview in Marked2 you immediately see the generated citation and bibliography in the style you have added.

To do this the proposed procedure is:

* Copy the `mmd-xslt` file
* Paste it in the folder `Applications`
* Rename it to `MarkedProcessor` (just to know what is it)
* In Marked2 go to Preferences/Advanced/ and in Custom Processor and/or Preprocessor in the Path add `/Applications/MarkedProcessor`
* Refresh preview
