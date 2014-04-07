require "bundler/gem_tasks"
require 'bundler/setup'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'coveralls/rake/task'

desc 'pry console for gem'
task :c do
  require 'pry'
  require 'lurker'
  ARGV.clear
  Pry.start
end

Coveralls::RakeTask.new
RSpec::Core::RakeTask.new(:spec)
Cucumber::Rake::Task.new(:cucumber)

EXAMPLE_PATH = './tmp/example_app'

namespace :clobber do
  desc "clobber coverage"
  task :coverage do
    rm_rf File.expand_path('../coverage', __FILE__)
  end

  desc "clobber the generated app"
  task :app do
    in_example_app "bin/spring stop" if File.exist?("#{EXAMPLE_PATH}/bin/spring")
    rm_rf EXAMPLE_PATH
  end
end

namespace :generate do
  desc "generate a fresh app with rspec installed"
  task :app do |t|
    unless File.directory?(EXAMPLE_PATH)
      sh "bundle exec rails new #{EXAMPLE_PATH} -m #{File.expand_path '../templates/example_app.rb', __FILE__} --skip-javascript --skip-sprockets --skip-git --skip-test-unit --skip-keeps --quiet"
    end
  end

  desc "generate a bunch of stuff with generators"
  task :stuff do
    in_example_app "LOCATION='../../templates/generate_stuff.rb' bin/rake rails:template --quiet --silent"
  end
end

def in_example_app(command)
  Dir.chdir(EXAMPLE_PATH) do
    Bundler.with_clean_env do
      sh command
    end
  end
end

desc 'destroys & recreates new test app'
task :regenerate => ["clobber:coverage", "clobber:app", "generate:app", "generate:stuff"]

task :default => [:spec, :regenerate, :cucumber, 'coveralls:push']

