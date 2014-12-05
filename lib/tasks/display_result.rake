desc "Display Ramu's performance."
task display_result_for_ramu: [:environment, :not_production, :disable_logger] do
  Rake::Task[:display_result_for].invoke('Ramu')
end

desc "Display Ramu's performance."
task display_result_for_will: [:environment, :not_production, :disable_logger] do
  Rake::Task[:display_result_for].invoke('Will')
end

desc "Display performance for user with given name"
task :display_result_for, [:name] do |t, args|
  user = User.find_by(first_name: args[:name])
  user.user_attempts.each do |attempt|
    question = attempt.question
    right_wrong = attempt.correct? ? 'Right' : 'Wrong'

    result = "#{question}\nRamu answered #{attempt.answers_to_s} which is the #{right_wrong} answer."
    result += " The correct answer is #{question.correct_options_to_s}" unless attempt.correct?
    puts "#{result}\n\n"
  end
end
