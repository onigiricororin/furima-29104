class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :last_read_name, format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください"}
    validates :first_read_name, format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください"}
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i ,
              message: "は半角英数字混合で入力してください。"} 
  end        
 
  
  
end
