class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i ,
              message: "は半角英数字混合で入力してください。"} 
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"} do
      validates :last_name 
      validates :first_name      
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください"} do
      validates :last_read_name
      validates :first_read_name
    end
  end
end
