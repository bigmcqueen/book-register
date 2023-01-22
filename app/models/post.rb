class Post < ApplicationRecord
  validates :title,
    length: { minimum: 1, maximum: 20 }

  validates :thoughts,
    length: { minimum: 1, maximum: 20 }
end
