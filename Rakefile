# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "git-tui"
  gem.homepage = "http://github.com/AndyObtiva/git-tui"
  gem.license = "Apache-2.0"
  gem.summary = %Q{Git-TUI (Git Text-based User Interface)}
  gem.description = %Q{Git-TUI (Git Text-based User Interface)}
  gem.post_install_message = "\nTo finish setting up the git-tui Ruby gem in your shell environment, run `git-tui-setup` in order to setup git-tui command and global git aliases/configuration.\n\n"
  gem.email = "andy.am@gmail.com"
  gem.authors = ["andy_maleh"]
  gem.executables = ['git-tui-setup']
  gem.files = Dir['README.md', 'LICENSE.txt', 'VERSION', 'bin/**/*', 'lib/**/*']
  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new
require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "git-tui #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
