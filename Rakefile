namespace :book do
  desc 'build basic book formats'
  task :build do

    `cp progit.asc progit.asc.bak`
    begin
      version_string = ENV['TRAVIS_TAG'] || `git describe --tags`.chomp
      if version_string.empty?
        version_string = '0'
      end
      text = File.read('progit.asc')
      new_contents = text.gsub("$$VERSION$$", version_string).gsub("$$DATE$$", Time.now.strftime("%Y-%m-%d"))
      File.open("progit.asc", "w") {|file| file.puts new_contents }

      puts "Generating contributors list"
      `git shortlog -s | grep -v -E "(Straub|Chacon)" | cut -f 2- | column -c 120 > book/contributors.txt`

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
      puts " -- PDF output at progit.pdf"

    ensure
      `mv progit.asc.bak progit.asc`
    end
  end
end

task :default => "book:build"
