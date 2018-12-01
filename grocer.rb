require 'pry'

def consolidate_cart(cart)
  # code here
  items = Hash.new(0)
  cart.each do |item|
    item.each do |name, details|
      items[name] = details
      items[name][:count] = 0
    end
  end

  cart.each do |item|
    item.each do |name, details|
      items[name][:count] += 1
    end
  end
  return items
end

def apply_coupons(cart, coupons)
  # code here
  cart.each do |items|
    items.each do |item_name, info|
      info.each do |k, v|
        binding.pry
      end
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
