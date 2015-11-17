require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'
require 'pp'
require 'shellwords'
require 'tempfile'
require 'open-uri'
require 'aws-sdk'
require 'json'
require 'nokogiri'
require 'csv'

task :default do
  Rake::Task["navigation"].invoke
  Rake::Task["javascripts/icanhaz.js"].invoke
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
    next if File.dirname(md) =~ /^node_modules\//
    next if File.basename(md) == 'icanhazpdf.md'

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

file "javascripts/icanhaz.js" => "javascripts/icanhaz.coffee" do |t|
  sh "./node_modules/.bin/coffee -bcp #{t.source} | ./node_modules/.bin/uglifyjs --screw-ie8 -o #{t.name}"
end

task :publish do
  sh "git pull"
  Rake::Task["navigation"].invoke
  Rake::Task["javascripts/icanhaz.js"].invoke
  Rake::Task["s3form"].invoke
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

task :s3form do
  key = ENV['ZOTPLUSAWSKEY']
  secret = ENV['ZOTPLUSAWSSECRET']
  credentials = ENV['ZOTPLUSAWSCREDENTIALS']

  if !key || !secret && credentials && File.exist?(credentials)
    puts credentials.inspect
    CSV.foreach(credentials, headers: true) do |row|
      next unless row['Access Key Id'] && row['Secret Access Key']
      next if row['Access Key Id'].strip == '' || row['Secret Access Key'].strip == ''
      key = row['Access Key Id']
      secret = row['Secret Access Key']
    end
  end

  logs = Dir['*.debug'] + Dir['*.log']
  logs = [] if ENV['CI'] == 'true' && ENV['LOGS2S3'] != 'true'

  if (ENV['TRAVIS_PULL_REQUEST'] || 'false') != 'false'
    puts "Logs 2 S3: Not logging pull requests"
  elsif !key || !secret
    puts "Logs 2 S3: No credentials"
  elsif logs.size == 0
    puts "Logs 2 S3: Nothing to do"
  else
    s3 = Aws::S3::Resource.new(region: 'eu-central-1', credentials: Aws::Credentials.new(key, secret))
    bucket = s3.bucket('zotplus-964ec2b7-379e-49a4-9c8a-edcb20db343f')
    obj = bucket.object('KeyName')
    expires = Time.now + (6*24*60*60) # 6 days from now
    post = bucket.presigned_post({
      signature_expiration: expires,
      acl: 'private',
      key: '${filename}'
    })

    form = {
      action: post.url.to_s,
      filefield: 'file',
      fields: post.fields
    }
    open('s3.json', 'w'){|f| f.puts(JSON.pretty_generate(form)) }

    builder = Nokogiri::HTML::Builder.new do |doc|
      doc.html {
        doc.head {
          doc.meta(charset: 'utf-8')
          doc.title { doc.text 'Upload' }
        }
        doc.body {
          doc.h2 { doc.text "valid until #{expires}" }
          doc.form(action: form[:action], method: 'POST', enctype: "multipart/form-data") {
            form[:fields].each_pair{|name, value|
              doc.input(type: 'hidden', name: name, value: value)
            }
            doc.input(type: 'file', name: 'file')
            doc.input(type: 'submit', value: 'Save')
          }
        }
      }
    end

    open('s3.html', 'w'){|f| f.write(builder.to_html) }
  end
end

