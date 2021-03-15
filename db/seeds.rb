# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { first_name: :Luvest, last_name: :Admin, email: 'adminLuvest@gmail.com', password: :lvstadmn },
  { first_name: :Jay, last_name: :Hardway, email: 'JayHardway@gmail.com', password: :hardway }
])

categories = Category.create!([
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'Machine Learning' }
])

tests = Test.create!([
  { title: 'Ruby start', level: 0, category_id: categories[1].id, author_id: users[0].id },
  { title: 'HTML base', level: 2, category_id: categories[0].id, author_id: users[0].id },
  { title: 'C++ base', level: 1, category_id: categories[2].id, author_id: users[1].id }
])

questions = Question.create!([
  { body: 'Ruby question', test_id: tests[0].id },
  { body: 'HTML question', test_id: tests[1].id },
  { body: 'C++ question', test_id: tests[2].id }
])

answers = Answer.create!([
  { body: 'Incorrect answer 1', correct: false, question_id: questions[0].id },
  { body: 'Correct answer', correct: true, question_id: questions[0].id },
  { body: 'Incorrect answer 1', correct: false, question_id: questions[1].id },
  { body: 'Correct answer', correct: true, question_id: questions[1].id },
  { body: 'Incorrect answer 1', correct: false, question_id: questions[2].id },
  { body: 'Correct answer', correct: true, question_id: questions[2].id },
])
