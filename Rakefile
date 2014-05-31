require 'bundler/setup'
require 'bundler/gem_helper'
require 'rspec/core/rake_task'
require 'rdoc/task'

RDoc::Task.new(:docs) do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'Iceburn'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new :test

task :default => %w(test docs build)
