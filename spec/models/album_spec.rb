require 'rails_helper'

RSpec.describe Album, type: :model do
  before do
    @album = FactoryBot.build(:album)
  end
  describe "アルバムの保存" do
    context "アルバムが保存できる時" do
      it "アルバム名の情報があれば保存できる" do
        expect(@album).to be_valid
      end
    end
    context "アルバムが保存できない時" do
      it "アルバム名が空だと保存できない" do
        @album.name = ""
        @album.valid?
        expect(@album.errors.full_messages).to include("Name can't be blank")
      end
      it "ユーザーが紐づいていないと保存できない" do
        @album.user = nil
        @album.valid?
        expect(@album.errors.full_messages).to include("User must exist")
      end
    end
  end
end
