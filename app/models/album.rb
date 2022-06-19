class Album < ApplicationRecord
  validates :name, presence: true
  has_many :diaries
  belongs_to :user
end
