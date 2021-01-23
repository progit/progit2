namespace :book do
  def exec_or_raise(command)
    puts `#{command}`
    if (! $?.success?)
      raise "'#{command}' failed"
    end
  end

  # Variables referenced for build
  version_string = ENV['TRAVIS_TAG'] || `git describe --tags`.chomp
  if version_string.empty?
    version_string = '0'
  end
  date_string = Time.now.strftime("%Y-%m-%d")
  params = "--attribute revnumber='#{version_string}' --attribute revdate='#{date_string}'"

  desc 'build basic book formats'
  task :build do

    begin
      puts "Generating contributors list"
      `git shortlog -s | grep -v -E "(Straub|Chacon|dependabot)" | cut -f 2- | column -c 120 > book/contributors.txt`

      puts "Converting to HTML..."
      `bundle exec asciidoctor #{params} -a data-uri progit.asc`
      puts " -- HTML output at progit.html"

      exec_or_raise('htmlproofer --check-html progit.html')

      puts "Converting to EPub..."
      `bundle exec asciidoctor-epub3 #{params} progit.asc`
      puts " -- Epub output at progit.epub"

      exec_or_raise('epubcheck progit.epub')

      # Commented out the .mobi file creation because the kindlegen dependency is not available.
      # For more information on this see: #1496.
      # This is a (hopefully) temporary fix until upstream asciidoctor-epub3 is fixed and we can offer .mobi files again.

      # puts "Converting to Mobi (kf8)..."
      # `bundle exec asciidoctor-epub3 #{params} -a ebook-format=kf8 progit.asc`
      # puts " -- Mobi output at progit.mobi"

      puts "Converting to PDF... (this one takes a while)"
      `bundle exec asciidoctor-pdf #{params} progit.asc 2>/dev/null`
      puts " -- PDF output at progit.pdf"

    end
  end
end

task :default => "book:build"
