class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
    if @line_item = line_items.find_by(item_id: item_id)
      @line_item.quantity += 1
      @line_item
    else
      line_items.new(:item_id => item_id, :quantity => 1)
    end
  end

  def total

    Cart.all.inject(0) { |result, element| result + price*quantity }
    #prices * quantities
    #sum (inject)
    # [1, 2, 3, 4].inject(0) { |result, element| result + element }
  end

end
