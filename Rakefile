require 'rubygems'
require 'bundler'

require File.expand_path('../lib/pixmatch/version', __FILE__)

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "pixmatch"
  gem.homepage = "http://github.com/dblock/pixmatch"
  gem.license = "MIT"
  gem.summary = %Q{Pixmatch REST API client library for Ruby}
  gem.description = %Q{Pixmatch REST API client library for Ruby}
  gem.email = "dblock@dblock.org"
  gem.version = Pixmatch::VERSION
  gem.authors = ["Daniel Doubrovkine"]
  gem.files = Dir.glob('lib/**/*')
end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "pixmatch #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

