class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, dependent: :destroy, through: :todo_lists, source: :todo_items

  validates :username, presence: true
end
