---
title: Support
---

# Getting support for the ZotPlus plugins

Before all else, ***thank you for taking the time for submitting an issue***, and I'm sorry that I've probably
interrupted your flow.
Your report matters to me. I love hearing my software helps you, and it pains me
to know that things aren't working for you.
If you have any questions on the use of the plugin, please do not hesitate to file a GitHub issue to ask for help. If
you're reporting a bug in the plugin, please take a moment to glance through the Support Request Guidelines; it will
make sure I get your problem fixed as quick as possible. Clear bug reports commonly have time-to-fix of 10 minutes. The
guidelines are very detailed, perhaps to the point of being off-putting, but please do not fret; these guidelines
simply express my ideal bug submission. I of course prefer very clearly documented issue reports over fuzzy ones, but I
prefer fuzzy ones over missed ones.

Unfortunately, however, my time is extremely limited for a number of very great reasons (you shall have to trust me on this). Because of this, I
cannot accept bug reports or support requests on anything but the latest version, currently at:

* [ASCII Rename](https://github.com/ZotPlus/zotero-ascii-rename/issues) {% include ascii-rename-version.html %}
* [Auto-index](https://github.com/ZotPlus/zotero-auto-index/issues) {% include auto-index-version.html %}
* [Better BibTeX](https://github.com/ZotPlus/zotero-better-bibtex/issues) {% include better-bibtex-version.html %}
* [Link local files](https://github.com/ZotPlus/zotero-link-local-files/issues) {% include link-local-files-version.html %}
* [OPDS Server](https://github.com/retorquere/zotero-opds/issues) {% include opds-version.html %}
* [Report Customizer](https://github.com/ZotPlus/zotero-report-customizer/issues) {% include report-customizer-version.html %}

If you submit an issue report, please include the version that you
are on. By the time I get to your issue, the latest version might
have bumped up already, and you will have to upgrade (you might
have auto-upgraded already however) and re-verify that your issue
still exists. Apologies for the inconvenience, but such
are the breaks.

## Better BibTeX

* You can send off an error report by choosing `Report ZotPlus Errors` from the gear menu. Post the resulting url in a
  github issue. If you go into the BBT preferences and enable "extended debugging", I'll have more information to work
  with, but don't keep it on indefinately as it'll slow doen Zotero. After you submit the error report, click continue
  to confirm, and post the debug ID you get back in the [issue tracker](https://github.com/ZotPlus/zotero-better-bibtex/issues)
* You can send off an error report for a specific collection or (selection of) items that fails to export by selecting those, right-clicking
  and choosing `Report ZotPlus Errors`

That in itself will in many cases give me what I need. Don't forget to copy the generated public ID to paste it into the github
issue; you cannot call it up later (although you can just so it again). Still, if you want a faster fix:

* **Please include *specifics* of what doesn't work**. I use this plugin every day myself, so "it doesn't work" is trivially
  false. Please tell me what you expected and what you see happening, and the relevant difference between them.
* **Please don't file a jumble of problems in one issue**. Posting a slew of separate issues is much preferred, as I can
  more easily tackle them one by one.
* **Do not hijack existing issues**. You can chime in on existing issues if you're close to certain it is the same problem,
  otherwise, open a new issue. I rather have duplicate issues than issues I cannot close because they are in fact two or
  more issues.
* **If your problem pertains to *importing BibTeX files*,** you ***must*** put up a sample for me to reproduce the issue with.
  *Do not* paste the sample in the issue, as the issue tracker will format it into oblivion. Instead, choose one of
  these options:
  * Post an URL in the issue where I can download your sample, or
  * Put the sample in a [gist](https://gist.github.com/) and post the URL of the gist into the issue, or 
  * upload your files to [dbinbox](http://dbinbox.com/allthatisthecase) -- please use descriptive file names (at least
    the issue number), as I can't see who uploaded what.
* **If your problem pertains to BBT interfering with other plugins** (which wouldn't be the first time), and this interference
  has something to do with importing, you ***must*** include a sample file that triggers the issue. I know it may seem
  that "any file triggers it" -- I need a *specific* file that does so I know we're looking at the same problem.

## Providing test cases

If you have a problem, right-clicking on a reference that exhibits the problem and selecting `Report ZotPlus Error` will send me a ready-to-use
testcase, inclusing your currents settings. If you are generously donating code, and happen to include a testcase
(always appreciated!) the test runner expects any BibTeX matching files to:

* Include a collection named after the name of the test file that holds the references. You get this if you export your
  whole library, and your whole library just happens to consist only of your test references.
* The BibTeX fields to be sorted, and
* The `timestamp` field of the reference to be `{2015-02-24 12:14:36 +0100}`
