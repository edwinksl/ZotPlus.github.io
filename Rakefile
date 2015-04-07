require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'

task :default do
  puts "jekyll serve"
end

task :publish do
  sh "git checkout master"
  sh "git pull origin master"
  sh "git add ."
  msg = []
  Dir['_includes/*version.html'].each{|version|
    project = File.basename(version, File.extname(version)).sub(/-version$/, '')
    version = open(version).read
    msg << "#{project} #{version}"
  }
  msg = msg.join(' / ')
  sh "git commit -m '#{msg}'"
  sh "git push origin master"
end
