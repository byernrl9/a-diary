class Diary < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
  validates :weather_id, numericality: { other_than: 1, message: 'を選択してください' }

  belongs_to :user
  belongs_to :album
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :weather

  def self.search(search)
    if search != ""
      Diary.where('place LIKE(?)', "%#{search}%")
    else
      Diary.all
    end
  end
end
