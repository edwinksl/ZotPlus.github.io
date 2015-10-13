require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'
require 'pp'
require 'shellwords'
require 'tempfile'
require 'open-uri'

task :default do
  puts "jekyll serve"
end

def clone(obj)
  return Marshal.load(Marshal.dump(obj))
end

task :navigation do
  nav = []
  project = nil
  Dir['**/*.md'].sort_by{|md|
    pos = File.basename(md)
    d = File.dirname(md)
    d = '000' if d == '.'

    if pos == 'index.md'
      pos = '000'
    else
      begin
        fm = YAML.load_file(md)
        p = fm['weight'].to_i
        if w > 0
          pos = "#{p}".rjust(3, '0')
        elsif fm['title'].to_s != ''
          pos = fm['title'].strip
        end
      rescue
      end
    end

    File.join(d, pos).sub(/^\.\//, '')
  }.each{|md|
    next if File.dirname(md) == 'debug-bridge'

    fm = nil
    begin
      fm = YAML.load_file(md)
    rescue
      fm = nil
    end

    title = fm ? fm['title'] : nil
    title = File.basename(md, File.extname(md)).gsub(/-/, ' ') if title.to_s == ''

    url = "/#{md}".sub(/\.md$/, '.html')
    if File.basename(md) == 'index.md'
      project = {
        'slug' => url.sub(/index.html$/, '').gsub('/', ''),
        'title' => title
      }
      project['slug'] = nil if project['slug'] == ''
    end

    if File.basename(md) == 'index.md'
      nav << {'title' => title, 'url' => url, 'project' => clone(project)}
    else
      nav[-1]['pages'] ||= []
      nav[-1]['pages'] << {'title' => title, 'url' => url, 'project' => clone(project)}
    end
  }

  meta = {}
  nav.each{|n|
    meta[n['url']] = clone(n)

    (n['pages'] || []).each{|p|
      meta[p['url']] = clone(p)
    }
  }

  FileUtils.mkdir_p '_data'
  open('_data/nav.yml', 'w'){|f| f.write(nav.to_yaml) }
  open('_data/meta.yml', 'w'){|f| f.write(meta.to_yaml) }
end

task :changelogs do
  sh "git pull"

  Tempfile.create(['changelog', '.md'], 'better-bibtex') do |tmp|
    versions = {}
    version = nil
    sh "github_changelog_generator -u ZotPlus -p zotero-better-bibtex -o #{Shellwords.escape(tmp.path)}"
    IO.readlines(tmp.path).each{|line|
      if line =~ /^## \[([^\]]+)\]/
        version = $1
        versions[version] = 0
        next
      end
      versions[version] += 1 if line =~ /^- /
    }
    skip = versions.keys.select{|v| versions[v] == 0}

    if skip.length > 0
      skip = "--exclude-tags " + skip.join(',')
    else
      skip = ''
    end
    sh "github_changelog_generator -u ZotPlus -p zotero-better-bibtex #{skip} -o #{Shellwords.escape(tmp.path)}"

    open('better-bibtex/CHANGELOG.md', 'w'){|f|
      f.write("---\ntitle: Change log\n---\n")
      f << open(tmp.path).read
    }
  end
end

task :publish do
  sh "git pull"
  Rake::Task["navigation"].invoke
  sh "git add ."
  msg = []
  Dir['_includes/*version.html'].each{|version|
    project = File.basename(version, File.extname(version)).sub(/-version$/, '')
    version = open(version).read
    msg << "#{project} #{version}"
  }
  msg = msg.join(' / ')
  sh "git commit -m '#{msg}'"
  sh "git push"
end
