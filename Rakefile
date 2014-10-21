namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'images' unless Dir.exists? 'images'
    Dir.glob("book/*/images/*").each do |image|
      FileUtils.copy(image, "images/" + File.basename(image))
    end
  end

  desc 'build basic book formats'
  task :build => :prebuild do
    puts "Converting to HTML..."
    `bundle exec asciidoctor progit.asc`
    puts " -- HTML output at progit.html"

    puts "Converting to EPub..."
    `bundle exec asciidoctor-epub3 progit.asc`
    puts " -- Epub output at progit.epub"

    puts "Converting to Mobi (kf8)..."
    `bundle exec asciidoctor-epub3 -a ebook-format=kf8 progit.asc`
    puts " -- Mobi output at progit.mobi"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf progit.asc 2>/dev/null`
    puts " -- PDF  output at progit.pdf"
  end
end
