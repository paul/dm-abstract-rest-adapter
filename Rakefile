require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "dm-abstract-rest-adapter"
    gem.summary = "An Adapter for DataMapper that handles the HTTP parts of a Restful Adapter. Can be used as a base for your own custom opinionated adapter."
    gem.email = "psadauskas@gmail.com"
    gem.homepage = "http://github.com/paul/dm-abstract-rest-adapter"
    gem.authors = ["Paul Sadauskas"]

    gem.add_runtime_dependency 'dm-core', '>= 0.10.0'
    gem.add_runtime_dependency 'resourceful', '>= 0.5.0'

    %w{rspec yard jeweler}.each do |dep|
      gem.add_development_dependency dep
    end

  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end


begin
  require 'spec/rake/spectask'
  
  desc 'Run all specs'
  Spec::Rake::SpecTask.new(:spec) do |t|
    t.spec_opts << '--options' << 'spec/spec.opts' if File.exists?('spec/spec.opts')
    t.libs << 'lib'
    t.spec_files = FileList['spec/**_spec.rb'] 
  end

  desc 'Default: Run Specs'
  task :default => :spec

  desc 'Run all tests'
  task :test => :spec

rescue LoadError
  puts "Please install rspec gem to run specs"
end

begin
  require 'yard'

  desc "Generate Yardoc"
  YARD::Rake::YardocTask.new do |t|
    t.files = ['lib/**/*.rb', 'README.markdown']
  end

rescue LoadError
  puts "Please install yard gem to run doc generation"
end

