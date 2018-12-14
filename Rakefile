# coding: utf-8
require 'octokit'
require 'github_changelog_generator'

def exec_or_raise(command)
  puts `#{command}`
  if (! $?.success?)
    raise "'#{command}' failed"
  end
end

module GitHubChangelogGenerator

  #OPTIONS = %w[ user project token date_format output
  #              bug_prefix enhancement_prefix issue_prefix
  #              header merge_prefix issues
  #              add_issues_wo_labels add_pr_wo_labels
  #              pulls filter_issues_by_milestone author
  #              unreleased_only unreleased unreleased_label
  #              compare_link include_labels exclude_labels
  #              bug_labels enhancement_labels
  #              between_tags exclude_tags exclude_tags_regex since_tag max_issues
  #              github_site github_endpoint simple_list
  #              future_release release_branch verbose release_url
  #              base configure_sections add_sections]

  def get_log(&task_block)
    options = Parser.default_options
    yield(options) if task_block

    options[:user],options[:project] = ENV['TRAVIS_REPO_SLUG'].split('/')
    options[:token] = ENV['GITHUB_API_TOKEN']
    options[:unreleased] = false

    generator = Generator.new options
    generator.compound_changelog
  end

  module_function :get_log
end

namespace :book do
  desc 'build basic book formats'
  task :build do

    puts "Generating contributors list"
    exec_or_raise("git shortlog -s --all $translation_origin | grep -v -E '(Straub|Chacon)' | cut -f 2- | sort | column -c 110 > book/contributors.txt")

    # detect if the deployment is using glob
    travis = File.read(".travis.yml")
    version_string = ENV['TRAVIS_TAG'] || '0'
    if travis.match(/file_glob/)
      progit_v = "progit_v#{version_string}"
    else
      progit_v = "progit"
    end
    text = File.read('progit.asc')
    new_contents = text.gsub("$$VERSION$$", version_string).gsub("$$DATE$$", Time.now.strftime("%Y-%m-%d"))
    File.open("#{progit_v}.asc", "w") {|file| file.puts new_contents }

    puts "Converting to HTML..."
    exec_or_raise("bundle exec asciidoctor #{progit_v}.asc")
    puts " -- HTML output at #{progit_v}.html"

    puts "Converting to EPub..."
    exec_or_raise("bundle exec asciidoctor-epub3 #{progit_v}.asc")
    puts " -- Epub output at #{progit_v}.epub"

    exec_or_raise("epubcheck #{progit_v}.epub")

    puts "Converting to Mobi (kf8)..."
    exec_or_raise("bundle exec asciidoctor-epub3 -a ebook-format=kf8 #{progit_v}.asc")
    # remove the fake epub that would shadow the really one
    exec_or_raise("rm progit*kf8.epub")
    puts " -- Mobi output at #{progit_v}.mobi"

    repo = ENV['TRAVIS_REPO_SLUG']
    puts "Converting to PDF... (this one takes a while)"
    if (repo == "progit/progit2-zh")
      exec_or_raise("asciidoctor-pdf-cjk-kai_gen_gothic-install")
      exec_or_raise("bundle exec asciidoctor-pdf -r asciidoctor-pdf-cjk -r asciidoctor-pdf-cjk-kai_gen_gothic -a pdf-style=KaiGenGothicCN #{progit_v}.asc")
    elsif (repo == "progit/progit2-ja")
      exec_or_raise("asciidoctor-pdf-cjk-kai_gen_gothic-install")
      exec_or_raise("bundle exec asciidoctor-pdf -r asciidoctor-pdf-cjk -r asciidoctor-pdf-cjk-kai_gen_gothic -a pdf-style=KaiGenGothicJP #{progit_v}.asc")
    elsif (repo == "progit/progit2-zh-tw")
      exec_or_raise("asciidoctor-pdf-cjk-kai_gen_gothic-install")
      exec_or_raise("bundle exec asciidoctor-pdf -r asciidoctor-pdf-cjk -r asciidoctor-pdf-cjk-kai_gen_gothic -a pdf-style=KaiGenGothicTW #{progit_v}.asc")
    elsif (repo == "progit/progit2-ko")
      exec_or_raise("asciidoctor-pdf-cjk-kai_gen_gothic-install")
      exec_or_raise("bundle exec asciidoctor-pdf -r asciidoctor-pdf-cjk -r asciidoctor-pdf-cjk-kai_gen_gothic -a pdf-style=KaiGenGothicKR #{progit_v}.asc")
    else
      exec_or_raise("bundle exec asciidoctor-pdf #{progit_v}.asc 2>/dev/null")
    end
    puts " -- PDF output at #{progit_v}.pdf"
  end

  desc 'tag the repo with the latest version'
  task :tag do
    api_token = ENV['GITHUB_API_TOKEN']
    if ((api_token) && (ENV['TRAVIS_PULL_REQUEST'] == 'false'))
      repo = ENV['TRAVIS_REPO_SLUG']
      @octokit = Octokit::Client.new(:access_token => api_token)
      begin
        last_version=@octokit.latest_release(repo).tag_name
      rescue
        last_version="2.1.-1"
      end
      new_patchlevel= last_version.split('.')[-1].to_i + 1
      new_version="2.1.#{new_patchlevel}"
      if  (ENV['TRAVIS_BRANCH']=='master')
        obj = @octokit.create_tag(repo, new_version, "Version " + new_version,
                                  ENV['TRAVIS_COMMIT'], 'commit',
                                  'Automatic build', 'automatic@no-domain.org',
                                  Time.now.utc.iso8601)
        begin
          @octokit.create_ref(repo, "tags/#{new_version}", obj.sha)
        rescue
          p "the ref already exists ???"
        end
        p "Created tag #{last_version}"
      elsif (ENV['TRAVIS_TAG'])
        version = ENV['TRAVIS_TAG']
        changelog = GitHubChangelogGenerator.get_log do |config|
          config[:since_tag] = last_version
        end
        credit_line = "\\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*"
        changelog.gsub!(credit_line, "")
        @octokit.create_release(repo, new_version, {:name => "v#{new_version}", :body => changelog})
        p "Created release #{new_version}"
      else
        p 'This only runs on a commit to master'
      end
    else
      p 'No interaction with GitHub'
    end
  end

  desc 'convert book to asciidoctor compatibility'
  task:convert do
    `cp -aR ../progit2/images .`
    `sed -i -e 's!/images/!!' .gitignore`
    `git add images`
    `git rm -r book/*/images`

    chapters = [
      ["01", "introduction"              ],
      ["02", "git-basics"                ],
      ["03", "git-branching"             ],
      ["04", "git-server"                ],
      ["05", "distributed-git"           ],
      ["06", "github"                    ],
      ["07", "git-tools"                 ],
      ["08", "customizing-git"           ],
      ["09", "git-and-other-scms"        ],
      ["10", "git-internals"             ],
      ["A",  "git-in-other-environments" ],
      ["B",  "embedding-git"             ],
      ["C",  "git-commands"              ]
    ]

    crossrefs = {}
    chapters.each { | num, title |
      if num =~ /[ABC]/
        chap = "#{num}-#{title}"
      else
        chap = "ch#{num}-#{title}"
      end
      Dir[File.join ["book","#{num}-#{title}" , "sections","*.asc"]].map { |filename|
        File.read(filename).scan(/\[\[(.*?)\]\]/)
      }.flatten.each { |ref|
        crossrefs[ref] = "#{chap}"
      }
    }

    headrefs = {}
    chapters.each { | num, title |
      if num =~ /[ABC]/
        chap = "#{num}-#{title}"
      else
        chap = "ch#{num}-#{title}"
      end
      Dir[File.join ["book","#{num}-#{title}", "*.asc"]].map { |filename|
        File.read(filename).scan(/\[\[([_a-z0-9]*?)\]\]/)
      }.flatten.each { |ref|
        headrefs[ref] = "#{chap}"
      }
    }

    # transform all internal cross refs
    chapters.each { | num, title |
      if num =~ /[ABC]/
        chap = "#{num}-#{title}"
      else
        chap = "ch#{num}-#{title}"
      end
      files = Dir[File.join ["book","#{num}-#{title}" , "sections","*.asc"]] +
              Dir[File.join ["book","#{num}-#{title}" ,"1-*.asc"]]
      p files
      files.each { |filename|
        content = File.read(filename)
        new_contents = content.gsub(/\[\[([_a-z0-9]*?)\]\]/, '[[r\1]]').gsub(
          "&rarr;", "→").gsub(/<<([_a-z0-9]*?)>>/) { |match|
          ch = crossrefs[$1]
          h = headrefs[$1]
          # p " #{match} -> #{ch}, #{h}"
          if ch
            # if local do not add the file
            if ch==chap
              "<<r#{$1}>>"
            else
              "<<#{ch}#r#{$1}>>"
            end
          elsif h
            if h==chap
              "<<#{chap}>>"
            else
              "<<#{h}##{h}>>"
            end
          else
            p "could not match xref #{$1}"
            "<<#{$1}>>"
          end
        }
        File.open(filename, "w") {|file| file.puts new_contents }
      }
    }

    chapters.each { | num, title |
      if num =~ /[ABC]/
        chap = "#{num}-#{title}"
      else
        chap = "ch#{num}-#{title}"
      end
      Dir[File.join ["book","#{num}-#{title}" ,"1*.asc"]].map { |filename|
        content = File.read (filename)
        new_contents = content.gsub(/include::(.*?)asc/) {|match|
          "include::book/#{num}-#{title}/#{$1}asc"}
        `git rm -f #{filename}`
        File.open("#{chap}.asc", "w") {|file|
          file.puts "[##{chap}]\n"
          file.puts new_contents }
        `git add "#{chap}.asc"`
      }
    }
  end
end



task :default => "book:build"
