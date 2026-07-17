require 'rubygems'
require 'bundler'

require 'bundler/gem_tasks'

task default: %i[clean spec cucumber tcltest rubocop build install]

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = %w[--format pretty --publish-quiet]
end

desc 'runs tcl test'
task :tcltest do
  sh({ 'TEST' => '1' }, 'tclsh lib/cucumber/tcl/test/test_framework.tcl')
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new do |task|
  task.fail_on_error = false
end

CLEAN.include %w[pkg/ tmp/]
