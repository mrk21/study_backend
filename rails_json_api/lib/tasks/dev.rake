namespace :dev do
  desc 'Setup'
  task :setup => ['db:drop','db:create','db:migrate','db:seed']
end
