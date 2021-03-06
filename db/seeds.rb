delete_all_records_from_all_tables
setup_users
setup_questions

def delete_all_records_from_all_tables
  ActiveRecord::Base.connection.schema_cache.clear!

  Dir.glob(Rails.root + 'app/models/*.rb').each { |file| require file }

  ActiveRecord::Base.descendants.each do |klass|
    klass.reset_column_information
    klass.delete_all
  end
end

def setup_users
  %w(ramu will).each do |user|
    create_user(email: "#{user}@example.com",
                first_name: user.capitalize,
                role: 'normal_user')
  end
end

def create_user(options = {})
  user_attributes = { email: 'john@example.com',
                      password: 'welcome',
                      first_name: 'John',
                      last_name: 'Smith',
                      role: 'super_admin' }
  attributes = user_attributes.merge options
  User.create! attributes
end

def setup_questions

end
