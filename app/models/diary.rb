class Diary < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
  validates :weather_id, numericality: { other_than: 1, message: 'を選択してください' }

  
  belongs_to :user
  belongs_to :calendar
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :weather
end
