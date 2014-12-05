desc 'Ramu answers all questions'
task process_result_for_ramu: [:environment, :not_production, :disable_logger] do
  Rake::Task[:process_result_for].invoke('Ramu', true)
end

desc 'Will answers all questions'
task process_result_for_will: [:environment, :not_production, :disable_logger] do
  Rake::Task[:process_result_for].invoke('Will', false)
end

desc 'Make user with the given name answer all questions'
task :process_result_for, [:name, :right] do |t, args|
  user = User.find_by(first_name: args[:name])
  Question.all.each do |question|
    UserAttempt.new do |attempt|
      attempt.user = user
      attempt.question = question
      attempt.answers = select_options(question, args[:right])
      attempt.save
    end
  end
  puts "Processed result for #{args[:name]}."
end

def select_options(question, right)
  if right
    question.correct_options
  elsif question.has_options
    question.incorrect_options.take(question.correct_options.count)
  else
    (1..question.correct_options.count).to_a
  end
end
