namespace :book do

  # Variables referenced for build
  version_string = `git describe --tags --abbrev=0`.chomp
  if version_string.empty?
    version_string = '0'
  else
    versions = version_string.split('.')
    version_string = versions[0] + '.' + versions[1] + '.' + versions[2].to_i.next.to_s
  end
  date_string = Time.now.strftime('%Y-%m-%d')
  params = "--attribute revnumber='#{version_string}' --attribute revdate='#{date_string}'"
  header_hash = `git rev-parse --short HEAD`.strip

  # Check contributors list
  # This checks commit hash stored in the header of list against current HEAD
  def check_contrib
    if File.exist?('book/contributors.txt')
      current_head_hash = `git rev-parse --short HEAD`.strip
      header = `head -n 1 book/contributors.txt`.strip
      # Match regex, then coerce resulting array to string by join
      header_hash = header.scan(/[a-f0-9]{7,}/).join

      if header_hash == current_head_hash
        puts "Hash on header of contributors list (#{header_hash}) matches the current HEAD (#{current_head_hash})"
      else
        puts "Hash on header of contributors list (#{header_hash}) does not match the current HEAD (#{current_head_hash}), refreshing"
        sh "rm book/contributors.txt"
        # Reenable and invoke task again
        Rake::Task['book/contributors.txt'].reenable
        Rake::Task['book/contributors.txt'].invoke
      end
    end
  end

  desc 'alapvető könyvformátumok előállítása'
  task :build => [:build_html, :build_epub, :build_fb2, :build_mobi, :build_pdf] do
    begin
        # Run check
        Rake::Task['book:check'].invoke

        # Rescue to ignore checking errors
        rescue => e
        puts e.message
        puts 'Hiba a könyvek ellenőrzése közben (mellőzve)'
    end
  end

  desc 'alapvető könyvformátumok előállítása (folyamatos integrációhoz)'
  task :ci => [:build_html, :build_epub, :build_fb2, :build_mobi, :build_pdf] do
      # Run check, but don't ignore any errors
      Rake::Task['book:check'].invoke
  end

  desc 'közreműködési lista előállítása'
  file 'book/contributors.txt' do
      puts 'Közreműködési lista előállítása'
      sh "echo 'Contributors as of #{header_hash}:\n' > book/contributors.txt"
      sh "git shortlog -s HEAD | grep -v -E '(Straub|Chacon|dependabot)' | cut -f 2- | sort | column -c 120 >> book/contributors.txt"
  end

  desc 'HTML formátum készítése'
  task :build_html => 'book/contributors.txt' do
      check_contrib()

      puts 'Átalakítás HTML formátumra...'
      sh "bundle exec asciidoctor #{params} -a data-uri progit.asc"
      puts ' -- HTML kimenet: progit.html'

  end

  desc 'Epub formátum készítése'
  task :build_epub => 'book/contributors.txt' do
      check_contrib()

      puts 'Átalakítás EPub formátumra...'
      sh "bundle exec asciidoctor-epub3 #{params} progit.asc"
      puts ' -- Epub kimenet: progit.epub'

  end

  desc 'FB2 formátum készítése'
  task :build_fb2 => 'book/contributors.txt' do
      check_contrib()

      puts 'Átalakítás FB2 formátumra...'
      sh "bundle exec asciidoctor-fb2 #{params} progit.asc"
      puts ' -- FB2 kimenet: progit.fb2.zip'

  end

  desc 'Mobi formátum készítése'
  task :build_mobi => 'book/contributors.txt' do
      check_contrib()

      puts "Átalakítás Mobi (kf8) formátumra..."
      sh "bundle exec asciidoctor-epub3 #{params} -a ebook-format=kf8 progit.asc"
      puts " -- Mobi kimenet: progit.mobi"
  end

  desc 'PDF formátum készítése'
  task :build_pdf => 'book/contributors.txt' do
      check_contrib()

      puts 'Átalakítás PDF formátumra... (eltarthat egy ideig)'
      sh "bundle exec asciidoctor-pdf #{params} progit.asc 2>/dev/null"
      puts ' -- PDF kimenet: progit.pdf'
  end

  desc 'Előállított könyvek ellenőrzése'
  task :check => [:build_html, :build_epub] do
      puts 'Előállított könyvek ellenőrzése'

      sh "htmlproofer progit.html"
      sh "epubcheck progit.epub"
  end

  desc 'Minden előállított fájl eltávolítása'
  task :clean do
    begin
        puts 'Elkészített fájlok eltávolítása'

        FileList['book/contributors.txt', 'progit.html', 'progit-kf8.epub', 'progit.epub', 'progit.fb2.zip', 'progit.mobi', 'progit.pdf'].each do |file|
            rm file

            # Rescue if file not found
            rescue Errno::ENOENT => e
              begin
                  puts e.message
                  puts 'Hiba a fájlok eltávolításakor (mellőzve)'
              end
        end
    end
  end

end

task :default => "book:build"
