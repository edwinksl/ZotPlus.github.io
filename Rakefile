require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'

task :default do
  puts "jekyll serve"
end

task :publish do
  puts `git pull`
  puts `git add .` 
  msg = []
  Dir['_includes/*version.html'].each{|version|
    project = File.basename(version, File.extname(version)).sub(/-version$/, '')
    version = open(version).read
    msg << "#{project} #{version}"
  }
  msg = msg.join(' / ')
  puts `git commit -m '#{msg}'`
  puts `git push`
end
