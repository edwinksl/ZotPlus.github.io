---
Title: State of PDF annotation on Android
---

Since I started my masters, I've tried several times to go all-digital, with limited success. One reason is that paper
still rules for reading and annotation speed while maintaining good comprehension levels. Another reason is that PDF
annotation on Android still sucks even in 2014.  I've tried all the apps I could find, paid or free. Here's what I've
found so far.

In my use of my tablet for reading academic articles, and I have to read a metric shitload of them pretty much all the
time, a *major* consideration for me is that an PDF-reading app should get out of my way as much as possible, preferably
allowing the speed of reading/page flipping/annotating to be similar to that of using pen & paper. That is a pipe dream,
I know, but the more I have to divert my attention to doing these as a conscious task, the worse it is. My requirements
then, in order:

1. Fast page flipping. Anything that blurs or delays the text while flipping is out, as it breaks my reading flow.
4. Page flipping like flipping through a book. With this I do not mean stupid animations, which I abhor; they usually
   add delay to the page flip, which is *already* slower than I want it to be, I mean like a book as opposed to continuous
   vertical scroll, which makes it just that much harder to mindlessly tap to the next chunk of content knowing sure
   that you haven't skipped anything, or to go back to the piece that I saw "3 or 4 pages ago".
3. Effortless text selection for annotation. If I have to fiddle around multiple times to select the sentence I want to
   highlight: reading flow gone.
2. PDF-standard highlighting and notes, or otherwise a well-documented annotation format. I highlight these texts digitally for a reason; if I can't extract these
   annotations later for summaries/search, they're useless, and I could just as well have stuck to paper & pen.

So what have I found?

# OK(ish)

These 3 are my current compromise. None of these hit all the points.

## [ezPDF](https://play.google.com/store/apps/details?id=udk.android.reader)

- Page flipping/rendering: Fast (if you enable pre-rendering, and you don't flip too fast), but very often requires two
  flips for a page change. Seems related to its handling of differences in page sizes if present in the PDF (always a problem with scans and JSTOR
  front-matter), but it's the only client I've tried that exhibits this behavior. Not so great for reading speed if it
  happens.
- Text selection: Very finnicky, hardly ever works the first time. Huge annoyance.
- Highlighting/Notes: Yes

ezPDF is my current mainstay, even if I'm not 100% happy with it. Main reason is that it supports page flips by taps &
volume button, and that it's not *impossible* to mark up text (that means you, Moon+). If I'm doing more than just very
occacional markup, I go to PDF Max (see comments for PDF Max for some ezPDF annoyances that it fixes).

## [Moon+ Reader](https://play.google.com/store/apps/details?id=com.flyersoft.moonreader)

- Page flipping/rendering: Fast, and keeps text centered even when zoomed in
- Text selection: *Extremely* finnicky, to the point that if I suspect I might be doing markup, I'm not starting up Moon+
- Highlighting/Notes: yes, but requires too much distance travelled across the screen to do (in addition to the
  finnickyness)

Moon+ syncs your current reading position to Dropbox, and has easy brightness control. The text positioning is fantastic
for reading, and if I know for *very* sure I'm only reading, Moon+ is my favorite. But for highlighting it's somewhere
near the bottom, beyond the 'Meh's.

## [PDF Max](https://play.google.com/store/apps/details?id=com.mbr.camellia)

- Page flipping/rendering: Fast
- Text selection: Decent, but sometimes won't allow selecting sentences and goes to qPDF Notes' 'block mode'
- Highlighting/Notes: Yes

This is a good alternative to ezPDF. Text selection is *much* better, but only swipes for page flipping, and I prefer
taps or volume buttons. If I'm doing moderate markup, PDF Max is my go-to viewer. One downside is that in order to
highlight the selected text you need to tap a button at the top of the screen, which means I have to 'let go' of the
text. I prefer ezPDFs method, where a popup menu appears right above the selected text. That is, once you have actually
managed to fiddle with the **expletive deleted** drag handles to select the text you want, in which time you *also* have
lost track of your reading, and in the time it takes to get this right in ezPDF you've done this 5 times over in PDF
Max. Why is PDF Max not my top choice?! Oh yeah, the page flipping swipes, and the occasional 'block mode' problem.

# Meh

## [iAnnotate PDF](https://play.google.com/store/apps/details?id=com.branchfire.iannotate)

- Page flipping/rendering: Speed is OK, but often cuts off corners, an often-reported problem the dev says he cannot reproduce
- Text selection: Accurate & easy
- Highlighting/Notes: Yes

This client is just such a huge friggin' let down. I've used the iOS version of iAnnotate, and in my view, if there is a
single reason to almost get an iDevice, it's iAnnotate. It's that good. But not on Android. On Android it's free, which
just goes to show that free isn't all that it's cracked up to be. I'd gladly pay *triple* the iOS price of the app if
they brought the Android version on a par with the iOS version.

## [RepliGo PDF Reader](https://play.google.com/store/apps/details?id=com.cerience.reader.app)

- Page flipping/rendering: s-l-o-w
- Text selection: OK
- Highlighting/Notes: Yes

## [Foxit MobilePDF](https://play.google.com/store/apps/details?id=com.foxit.mobile.pdf.lite)

- Page flipping/rendering: s-l-o-w
- Text selection: Finnicky
- Highlighting/Notes: Yes

## [Xodo Docs](https://play.google.com/store/apps/details?id=com.xodo.pdf.reader)
- Page flipping/rendering: slow
- Text selection: Easy & accurate
- Highlighting/Notes: Yes

# Rubbish

## [Mantano Ebook Reader Premium](https://play.google.com/store/apps/details?id=com.mantano.reader.android)

- Page flipping/rendering: *super* fast
- Text selection: Accurate & easy, a joy to use
- Highlighting/Notes: yes, and editable after the fact. Too bad it stores its annotations in a **proprietary format**, so no note extraction. This is a showstopper for me.

Mantano syncs documents & reading positions to the cloud -- their cloud, to be specific, so you can forget about things
like GDrive/Dropbox integration

## [qPDF Notes Pro PDF Reader](https://play.google.com/store/apps/details?id=com.qoppa.activities.noteskey)

- Page flipping/rendering: Fast, but only vertical scroll, no page flipping. I find this very annoying for reading
- Text selection: Only rectangular sections, no sentences. Entirely unusable. I don't know what the devs were thinking.
- Highlighting/Notes: Sort of, I guess. If you ever manage to select the text you want highlighted, you can. Since that premise is structurally false: no

## [EBookDroid - PDF & DJVU Reader](https://play.google.com/store/apps/details?id=org.ebookdroid)
- Page flipping/rendering: s-l-o-w
- Text selection: OK
- Highlighting/Notes: No

## [Adobe Reader](https://play.google.com/store/apps/details?id=com.adobe.reader)
- Page flipping/rendering: Fast, but only vertical scroll
- Text selection: Fiddly and inaccurate
- Highlighting/Notes: Yes

## [Kingsoft Office + PDF](https://play.google.com/store/apps/details?id=cn.wps.moffice_eng)/[Kingsoft Office + PDF](https://play.google.com/store/apps/details?id=cn.wps.moffice_i18n)
- Page flipping/rendering: Decent
- Text selection: Decent, but not great
- Highlighting/Notes: No

## [Docs To Go](https://play.google.com/store/apps/details?id=com.dataviz.docstogo)
- Page flipping/rendering: Only vertical scroll, and blurs everything it doesn't consider the current page. Unusable
- Text selection: Decent, but not great
- Highlighting/Notes: No

## [Qiqqa](https://play.google.com/store/apps/details?id=com.qiqqa.android.qiqqa)
- Page flipping/rendering: Fast, but only vertical scroll.
- Text selection: Decent, but not great
- Highlighting/Notes: No

Zooming is broken, and standard zoom doesn't use the full screen real estate, stupid random bubbles on the left hand
margin. No idea what the idea behind this is.

## [Fabrik Cloud Reader Stories](https://play.google.com/store/apps/details?id=es.icereader)
- Page flipping/rendering: Not applicable, it forces text reflow. Unusable for academic articles. App has disappeared
  from the Play Store

## [Note Anytime](https://play.google.com/store/apps/details?id=com.metamoji.noteanytime)
- Page flipping/rendering: *damn* slow

## [Amazon Kindle](https://play.google.com/store/apps/details?id=com.amazon.kindle)
- Page flipping/rendering: Fast
- Text selection: Accurate & easy
- Highlighting/Notes: Proprietary format - useless

## [Quickoffice](https://play.google.com/store/apps/details?id=com.quickoffice.android)
- Page flipping/rendering: Fast
- Text selection: No
- Highlighting/Notes: No

## [SmartQ Reader](https://play.google.com/store/apps/details?id=com.smartdevices.special)
- Page flipping/rendering: Fast, and seems to use some kind of font smoothing that I like
- Text selection: Easy & Accurate
- Highlighting/Notes: Proprietary
