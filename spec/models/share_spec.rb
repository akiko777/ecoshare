require 'rails_helper'

RSpec.describe Share, type: :model do
  before do
    @share = FactoryBot.build(:share)
  end

  describe '新規投稿' do
    context "新規投稿ができるとき" do
      it "全ての項目の入力が存在すれば投稿できること" do
        expect(@share).to be_valid
      end
    end

    context "新規投稿ができないとき" do
      it "画像がないと投稿できない" do
        @share.image = nil
        @share.valid?
        expect(@share.errors.full_messages).to include("Image can't be blank")
      end
      it "タイトルがないと投稿できない" do
        @share.title = nil
        @share.valid?
        expect(@share.errors.full_messages).to include("Title can't be blank")
      end
      it "シェアしたい内容がないと投稿できない" do
        @share.share = nil
        @share.valid?
        expect(@share.errors.full_messages).to include("Share can't be blank")
      end
    end
  end
end
