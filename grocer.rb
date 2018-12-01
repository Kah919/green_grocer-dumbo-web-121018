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

def apply_coupons(cart, coupons) # how can I make this better without DRY code?
  # code here
  checkout = {}
    cart.each do |item_name, details|
      checkout[item_name] = details
      coupons.each do |discount_item|
        if discount_item[:item] == item_name
          checkout[item_name][:count] -= discount_item[:num]
          checkout["#{discount_item[:item]} W/COUPON"] ||= { price: discount_item[:cost], clearance: details[:clearance]}
          checkout["#{discount_item[:item]} W/COUPON"][:count] ||= 0
          checkout["#{discount_item[:item]} W/COUPON"][:count] += 1
        end
      end
    end
  return checkout
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
