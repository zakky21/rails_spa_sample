class Label < ApplicationRecord
  has_many :todo_labels, dependent: :destroy
  has_many :todo, through: :todo_labels
  enum status: { yet: 1, wip: 2, done: 3 }
end
