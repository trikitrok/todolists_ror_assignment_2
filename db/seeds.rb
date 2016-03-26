# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

def due_date
  Date.today + 1.year
end

def items username
  (1..5).map do |n|
    TodoItem.create(
      due_date: due_date,
      title: "#{username} sth_#{n}",
      description: "bla bla #{n}",
      completed: false
    )
  end
end

user_list = [
  ["Carly", "Fiorina", "female", 1954],
  ["Donald", "Trump", "male", 1946],
  ["Ben", "Carson", "male", 1951],
  ["Hillary", "Clinton", "female", 1947]
]

User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

user_list.each do |first_name, last_name, gender, birth_year|
  User.create!(
    username: last_name,
    password_digest: last_name.reverse,
    profile: Profile.create(
      first_name: first_name,
      last_name: last_name,
      gender: gender,
      birth_year: birth_year
    ),
    todo_lists: [
      TodoList.create(
        {
          list_name: "#{last_name} todo list",
          list_due_date: due_date,
          todo_items: items(last_name)
        }
      )
    ]
  )
end
