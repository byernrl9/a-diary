require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    user = FactoryBot.create(:user)
    album = FactoryBot.create(:album)
    @diary = FactoryBot.build(:diary, user_id: user.id, album_id: album.id)
  end
  describe "日記投稿の保存" do
    context "日記投稿が保存できる時" do
      it "全ての情報が正しく入力されてるとき" do
        expect(@diary).to be_valid
      end
      it "placeは空でも保存ができる" do
        @diary.place = ""
        expect(@diary).to be_valid
      end
    end
    context "日記投稿が保存できないとき" do
      it "タイトルが空だと保存できない" do
        @diary.title = ""
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Title can't be blank")
      end
      it "出来事内容がからだと保存できない" do
        @diary.content = ""
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Content can't be blank")
      end
      it "画像が空だと保存できない" do
        @diary.image = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Image can't be blank")
      end
      it "日時が空だと保存ができない" do
        @diary.start_time = ""
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Start time can't be blank")
      end
      it "天気が空だと保存できない" do
        @diary.weather_id = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Weather を選択してください")
      end
      it "ユーザーが紐付いてないと保存できない" do
        @diary.user = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("User must exist")
      end
      it "アルバムが紐付いてないと保存できない" do
        @diary.album = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Album must exist")
      end
    end
  end
end
