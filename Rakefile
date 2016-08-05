# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :grape do
  desc 'Print compiled grape routes'
  task :routes => :environment do
    API.routes.each do |route|
      puts route
    end
  end
end