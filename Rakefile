require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'

task :default do
  puts "jekyll serve"
end

task :publish do
  sh "git pull"
  sh "git add ."
  msg = []
  Dir['_includes/*version.html'].each{|version|
    project = File.basename(version, File.extname(version)).sub(/-version$/, '')
    version = open(version).read
    msg << "#{project} #{version}"
  }
  msg = msg.join(' / ')
  sh "git commit -m '#{msg}'"
  #if ENV['GITHUB_TOKEN']
  #  sh "git push --force --quiet 'https://#{ENV['GITHUB_TOKEN']}@github.com/ZotPlus/ZotPlus.github.io.git' master:master > /dev/null 2>&1"
  #else
    sh "git push"
  #end
end
