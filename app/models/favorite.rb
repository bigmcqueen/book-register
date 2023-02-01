class Favorite < ApplicationRecord
  validates :user_id, {presence: true}
  validates :record_id, {presence: true}
end
