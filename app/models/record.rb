class Record < ApplicationRecord
  validates :title, :thoughts, {presence: true, length: {maximum: 20}}
end
