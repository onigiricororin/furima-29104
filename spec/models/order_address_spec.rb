require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入機能" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it "token,user_id,item_id,order_id,郵便番号、都道府県、市区町村、番地、電話番号があれば登録できる" do
      expect(@order_address).to be_valid
    end

    it "user_idが空だと登録できない" do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空だと登録できない" do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it "郵便番号が空だと登録できない" do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code ハイフンが含まれていません")
    end

    it "都道府県が空だと登録できない" do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
   
    it "市区町村が空だと登録できない" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
   
    it "番地が空だと登録できない" do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
   
    it "電話番号が空だと登録できない" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
   
    it "tokenが空だと登録できない" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "正しいクレジットカードの情報で無いときは決済できないこと" do
      @order_address.token = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")

    end

    it "郵便番号にはハイフンが必要であること（123-4567となる）" do
      @order_address.postal_code = 1234567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code ハイフンが含まれていません")
    end

    it "電話番号にはハイフンは不要で、11桁以内であること" do
      @order_address.phone_number = 12345678912345
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number 11文字以内で入力してください")
    end


  end



end
