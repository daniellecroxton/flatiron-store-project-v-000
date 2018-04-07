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
    total = 0
    line_items.each do |line_item|
      total += line_item.quantity * line_item.item.price
    end
      total
  end

  def subtract_from_inventory
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
    end
  end

  def checkout
    subtract_from_inventory
    status = "submitted"
  end


end
