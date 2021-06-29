= Pro Git, Second Edition

Welcome to the second edition of the Pro Git book.

You can find this book online at: https://git-scm.com/book

Like the first edition, the second edition of Pro Git is open source under a Creative Commons license.

A couple of things have changed since open sourcing the first edition.
For one, we've moved from Markdown to the amazing AsciiDoc format for the text of the book; here's an https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/[AsciiDoc quick reference].

We've also moved to keeping the translations in separate repositories rather than subdirectories of the English repository.
See link:TRANSLATING.md[the translating document] for more information.

== How To Generate the Book

You can generate the e-book files manually with Asciidoctor.
If you run the following you _may_ actually get HTML, Epub, Mobi and PDF output files:

----
$ bundle install
$ bundle exec rake book:build
Converting to HTML...
 -- HTML output at progit.html
Converting to EPub...
 -- Epub output at progit.epub
Converting to Mobi (kf8)...
 -- Mobi output at progit.mobi
Converting to PDF...
 -- PDF output at progit.pdf
----

You can generate just one of the supported formats (HTML, EPUB, mobi, or PDF).
Use one of the following commands:

To generate the HTML book:

----
$ bundle exec rake book:build_html
----

To generate the EPUB book:

----
$ bundle exec rake book:build_epub
----

To generate the mobi book:

----
$ bundle exec rake book:build_mobi
----

To generate the PDF book:

----
$ bundle exec rake book:build_pdf
----

== Signaling an Issue

Before signaling an issue, please check that there isn't already a similar one in the bug tracking system.

Also, if this issue has been spotted on the git-scm.com site, please cross-check that it is still present in this repo.
The issue may have already been corrected, but the changes have not been deployed yet.

== Contributing

If you'd like to help out by making a change, take a look at the link:CONTRIBUTING.md[contributor's guide].
