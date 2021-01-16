require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入機能" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it "user_id,item_id,order_id,郵便番号、都道府県、市区町村、番地、電話番号があれば登録できる" do
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
   

    it "ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移すること" do


    end

    it "出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること" do
    end

    it "URLを直接入力して購入済み商品の購入ページへ遷移しようとすると、トップページに遷移すること" do
    end

    it "クレジットカード決済ができること" do
    end

    it "クレジットカードの情報は購入の都度入力させること" do
    end

    it "クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと" do
    end

    it "配送先の住所情報も購入の都度入力させること" do
    end

    it "配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること" do
    end

    it "郵便番号にはハイフンが必要であること（123-4567となる）" do
    end

    it "電話番号にはハイフンは不要で、11桁以内であること" do
    end

    it "購入が完了したら、トップページまたは購入完了ページに遷移すること" do
    end

    it "購入した商品は、再度購入できない状態になっていること" do
    end

    it "エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）" do
    end

    it "" do
    end

    it "" do
    end

    it "" do
    end

    it "" do
    end
  end



end
