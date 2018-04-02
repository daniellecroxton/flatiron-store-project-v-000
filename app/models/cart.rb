class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item)
    # binding.pry
    if self.line_items.ids.detect(item)
      line_item.quantity += 1
    else
      LineItem.new(cart_id: self.id, item_id: item, quantity: 1)
    end
  end

  def total
    #prices * quantities
    #sum
  end

end
