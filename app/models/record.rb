class Record < ApplicationRecord
  validates :title, :thoughts, {presence: true, length: {maximum: 20}}
  validates :user_id, {presence: true}
end
