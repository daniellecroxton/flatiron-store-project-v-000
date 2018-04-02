class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.available_items
    self.all.drop(0).collect do | i |
      if i.inventory > 0
      end
    end
  end
end
