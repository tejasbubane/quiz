desc 'Creates sample users (Ramu and Will)'
task create_users: [:environment, :not_production] do
  users = %w(ramu will)
  users.each do |user|
    create_user(email: "#{user}@example.com",
                first_name: user.capitalize,
                role: 'normal_user')
  end
  puts "Users #{users} created."
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
