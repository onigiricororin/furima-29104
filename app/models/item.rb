class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :days_to_ship


  with_options presence: true do
    validates :image
    validates :name
    validates :summary
    validates :price, numericality: {greater_than: 300, less_than: 9999999 } 

    with_options numericality: { other_than: 1, message: "が入力されていません"} do
      validates :category_id
      validates :condition_id
      validates :burden_id
      validates :prefecture_id
      validates :days_to_ship_id
    end

  end


end
