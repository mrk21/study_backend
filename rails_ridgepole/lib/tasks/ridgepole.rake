namespace :db do
  desc 'Apply the schema file to the database'
  task :apply do
    sh "bin/ridgepole -c config/database.yml -f db/Schemafile.rb -E #{Rails.env} --apply"
  end
  
  desc 'Show database schema changes'
  task :changes do
    sh "bin/ridgepole -c config/database.yml -f db/Schemafile.rb -E #{Rails.env} --apply --dry-run"
  end
  
  desc 'Export a schema file from the database'
  task :export do
    sh "bin/ridgepole -c config/database.yml -E #{Rails.env} --export -o db/Schemafile.rb"
  end
end
