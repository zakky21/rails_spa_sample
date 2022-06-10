class TodoLabel < ApplicationRecord
  belongs_to :label
  belongs_to :todo
end
