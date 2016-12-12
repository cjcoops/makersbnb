if ENV['RACK ENV'] != 'production'
  require 'rspec/core/rake_task'
  require './app/app.rb'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'data_mapper'
require './app/data_mapper_setup'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto_upgrade complete (no data loss)"
  end

  desc "Destuctive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto_migrate complete (data was lost)"
  end
end
