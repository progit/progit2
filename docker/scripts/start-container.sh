#!/bin/sh
[ -d images ] || mkdir images
for image in book/*/images/*; do
    cp "$image" "images/$(basename "$image")"
done

printf "Converting to HTML...\n"
asciidoctor progit.asc
printf " -- HTML output at progit.html\n"

printf "Converting to EPub...\n"
asciidoctor-epub3 progit.asc
printf " -- Epub output at progit.epub\n"

printf "Converting to Mobi (kf8)...\n"
asciidoctor-epub3 -a ebook-format=kf8 progit.asc
printf " -- Mobi output at progit.mobi\n"

printf "Converting to PDF... (this one takes a while)\n"
asciidoctor-pdf progit.asc 2>/dev/null
printf " -- PDF  output at progit.pdf\n"
