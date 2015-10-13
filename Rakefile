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
    skip = "--exclude-tags 1.5.1,1.2.35,1.2.32,1.2.16,1.2.7,1.2.3,1.2.1,1.0.18,1.0.13,1.0.11,1.0.1,1.0.0,0.14.16,0.14.13,0.14.10,0.14.8,0.14.2,0.14.1,0.13.15,0.13.14,0.13.13,0.13.11,0.13.9,0.13.7,0.13.6,0.13.3,0.13.2,0.13.1"
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
