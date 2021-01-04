require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/star.png")
    end

    it "user_id,商品画像,商品名,商品の説明,販売価格,カテゴリー,商品の状態,配送料の負担,発送元の地域,発送までの日数が条件通り入力されていれば出品できる" do
      expect(@item).to be_valid
    end

    it "画像は1枚必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が必須であること" do
      @item.summary = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Summary can't be blank")
    end

    it "カテゴリーの情報が必須であること" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category が入力されていません")
    end

    it "商品の状態についての情報が必須であること" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition が入力されていません")
    end

    it "配送料の負担についての情報が必須であること" do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden が入力されていません")
    end

    it "発送元の地域についての情報が必須であること" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture が入力されていません")
    end

    it "発送までの日数についての情報が必須であること" do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship が入力されていません")
    end

    it "価格が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が¥300より安いと保存できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it "価格が¥9999999より高いと保存できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end

    it "販売価格は半角数字であること" do
      @item.price = "１２３４"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

  end
end
