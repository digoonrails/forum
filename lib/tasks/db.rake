namespace :db do
  desc 'Run: drop, create, migrate and seed'
  task :populate => :environment do
    system 'rake db:drop --trace; rake db:create --trace; rake db:migrate --trace; rake db:seed --trace'
  end
end