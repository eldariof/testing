require "rake"
require "rspec"
require "rake"
require "rspec/version"
require 'rspec/core/rake_task'

task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|  
  t.pattern = "./rspec/*_spec.rb"
end

