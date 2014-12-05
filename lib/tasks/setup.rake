desc 'Ensure that code is not running in production environment'
task :not_production do
  raise 'do not run in production' if Rails.env.production?
end

desc 'Disable logger for rake tasks'
task disable_logger: [:environment] do
  dev_null = Logger.new("/dev/null")
  Rails.logger = dev_null
  ActiveRecord::Base.logger = dev_null
end

desc 'Sets up the project by running migration and populating sample data'
task setup: [:environment, :not_production, :disable_logger, 'db:drop', 'db:create', 'db:migrate'] do
  delete_all_records_from_all_tables

  %w(create_users create_questions).each { |task| Rake::Task[task].invoke }

  puts 'Data setup successful'
end

def delete_all_records_from_all_tables
  ActiveRecord::Base.connection.schema_cache.clear!

  Dir.glob(Rails.root + 'app/models/*.rb').each { |file| require file }

  ActiveRecord::Base.descendants.each do |klass|
    klass.reset_column_information
    klass.delete_all
  end
end
