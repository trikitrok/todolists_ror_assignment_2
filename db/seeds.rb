# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

def items username
  (1..5).map do |n|
    TodoItem.create(
      due_date: Date.new,
      title: "#{username} sth_#{n}",
      description: "bla bla #{n}",
      completed: false
    )
  end
end

User.create! [
  {
    username: "Fiorina",
    password_digest: "",
    profile: Profile.create(
      first_name: "Carly",
      last_name: "Fiorina",
      gender: "female",
      birth_year: 1954
    ),
    todo_lists: [
      TodoList.create(
        {
          list_name: "x",
          list_due_date: Date.new,
          todo_items: items("Fiorina")
        }
      )
    ]
  },
  {
    username: "Trump",
    password_digest: "",
    profile: Profile.create(
      first_name: "Donald",
      last_name: "Trump",
      gender: "male",
      birth_year: 1946
    ),
    todo_lists: [
      TodoList.create(
        {
          list_name: "x",
          list_due_date: Date.new,
          todo_items: items("Trump")
        }
      )
    ]
  },
  {
    username: "Carson",
    password_digest: "",
    profile: Profile.create(
      first_name: "Ben",
      last_name: "Carson",
      gender: "male",
      birth_year: 1951
    ),
    todo_lists: [
      TodoList.create(
        {
          list_name: "x",
          list_due_date: Date.new,
          todo_items: items("Carson")
        }
      )
    ]
  },
  {
    username: "Clinton",
    password_digest: "",
    profile: Profile.create(
      first_name: "Hillary",
      last_name: "Clinton",
      gender: "female",
      birth_year: 1947
    ),
    todo_lists: [
      TodoList.create(
        {
          list_name: "x",
          list_due_date: Date.new,
          todo_items: items("Clinton")
        }
      )
    ]
  }
]
