desc 'Creates sample questions'
task create_questions: [:environment, :not_production] do
  create_question('Capital of India is',
                  { 'A' => 'Bombay', 'B' => 'Calcutta',
                    'C' => 'Madras', 'D' => 'New Delhi' },
                  %w(D))

  create_question('Cricket is favorite sports in India',
                  { 'A' => 'True', 'B' => 'False' },
                  %w(A))

  create_question('Madan has 4 mangoes. His mother gave him 3 more mangoes. '\
                  'Now Madan has __ mangoes. He gave 2 mangoes to his sister. '\
                  'Now he has ___ mangoes.',
                  nil, %w(7 5))

  create_question('Complete the series 25,35,45, __, __, __',
                  nil, %w(55 65 75))

  create_question('Cost of a candy is 5 cents. I have 30 cents. '\
                  'Select all true statements.',
                  { 'A' => 'I can buy 2 candies.', 'B' => 'I can buy 4 candies.',
                    'C' => 'I can buy 6 candies.', 'D' => 'I can buy 8 candies.' },
                  %w(A B))
end

def create_question(que, answers, correct_answers)
  question = Question.new(text: que)
  if answers
    question.has_options = true
    answers.each do |option, text|
      answer = Answer.new(option: option,
                          text: text,
                          correctness: correct_answers.include?(option))
      question.answers << answer
    end
  else
    question.has_options = false
    correct_answers.each do |text|
      answer = Answer.new(option: nil,
                          text: text,
                          correctness: true)
      question.answers << answer
    end
  end
  question.save
end
