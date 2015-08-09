---
title: Unicode problems
---
# Unicode problems

Zotero does all its work in UTF-8 Unicode, which is absolutely the right thing to do. Unfortunately, for those shackled
to BibTeX and who cannot (yet) move to BibLaTeX, unicode is a major PITA. Also, Zotero supports some simple HTML markup
in your references that Bib(La)TeX won't understand; BBT will

* converts from/to HTML/LaTeX; Currently supports &lt;i&gt;&#8660;\emph &amp; \textit, &lt;b&gt;&#8660;\textbf,
  &lt;sup&gt;&#8660;\_{...},
  &lt;sub&gt;&#8660;^{...} and &lt;sc&gt;&#8660;\\textsc{...}; more can
  be added on request.
* The plugin contains a comprehensive list of LaTeX constructs, so stuff like \\"{o} or \\"o will be converted to their unicode equivalents on import.

