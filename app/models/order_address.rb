class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:order_id,:postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "ハイフンが含まれていません"}
    validates :prefecture_id,numericality: { other_than: 1, message: "が入力されていません"}
    validates :city
    validates :house_number
    validates :phone_number, exclusion: { in: %w(-),message: "ハイフンを含まないでください"},
                             length: { maximum: 11, message: "11文字以内で入力してください" }
  end

  def save
    order = Order.create( user_id: user_id, item_id: item_id )
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,city: city, house_number: house_number ,building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end