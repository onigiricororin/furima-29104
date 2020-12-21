require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザーの新規登録" do
    before do 
      @user = FactoryBot.build(:user)
    end

    it "nickname,last/first_name,last/first_read_name,birthday,email、password,password_confirmationが条件通り存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できない" do  
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "birthdayが空では登録できない" do  
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

     it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      email = @user.email
      @user = FactoryBot.build(:user)
      @user.email = email
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

     it "@を含まないemailは登録できない" do
      @user.email = "emailatemail"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

     it "passwordは6文字未満では登録できない" do
      @user.password = "12qw"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 7 characters)")
    end

    it "passwordは半角英数字混合でないと登録できない" do
      @user.password = "12345678"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください。")
    end

     it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "1234qwer"
      @user.password_confirmation = "qwer1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

     it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

     it "last_nameが全角（漢字・ひらがな・カタカナ）意外では登録できない" do
      @user.last_name = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください。")
    end

    it "first_nameが全角（漢字・ひらがな・カタカナ）意外では登録できない" do
      @user.first_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
    end

     it "last_read_nameが空では登録できない" do
      @user.last_read_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last read name can't be blank")
    end

    it "first_read_nameが空では登録できない" do
      @user.first_read_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First read name can't be blank")
    end

    it "last_read_nameが全角（カタカナ）以外では登録できない" do
      @user.last_read_name = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last read name は全角カタカナで入力してください")
    end
    
    it "first_read_nameが全角（カタカナ）以外では登録できない" do
      @user.first_read_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First read name は全角カタカナで入力してください")
    end
  end
end


