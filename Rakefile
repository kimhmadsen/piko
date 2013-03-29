require "rake"
require "rake/testtask"
require "bundler/gem_tasks"

task :default => :test



Rake::TestTask.new :test do |t|
  t.verbose = true
  t.pattern = "test/test_*.rb"
end