require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'
require 'rcov/rcovtask'
#require 'rake/classic_namespace'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "cards"
    s.summary = "Tiny Framework for creating card based games like Magic: The Gathering."
    s.email = "soleone@gmail.com"
    s.homepage = "http://github.com/Soleone/cards"
    s.description = "Create different types of cards in any setting (fantasy, real, science-fiction) that can fight with each other."
    s.authors = ["Soleone"]
  end
rescue LoadError
  puts "Juweler not available. Just install it with: sudo gem install technical-pickles -s http://gems.github.com"
end

Spec::Rake::SpecTask.new do |t|
  t.libs << 'lib'
  t.spec_opts = ["--format specdoc --color"]
end

Rake::RDocTask.new do |doc|
  doc.rdoc_dir = "rdoc"
  doc.title = "Cards"
  doc.options << "--line-numbers" << "--inline-source"
  doc.rdoc_files.include("README*")
  doc.rdoc_files.include("lib/**/*.rb")
end

Spec::Rake::SpecTask.new(:rcov) do |t|
  t.libs << 'spec'
  t.rcov = true
  t.rcov_opts = ["-T -x gems/r"]
end

desc "Show features and improvements that need to be implemented (if you want to help)"
task :todo do |t|
  lines = File.readlines("README.textile")
  items = lines.select { |l| l =~ /^# [^-].*/ }.map{ |l| l[2..-1] }
  puts "\n\nThings you can do if you want to help:"
  items.each_with_index { |todo, index| puts "#{index+1}. #{todo}" }
end

task :default => :spec