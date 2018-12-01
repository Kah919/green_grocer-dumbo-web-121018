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
  checkout = cart
  cart.each do |item_name, info|
    coupons.each do |coupon|
      if coupon[:item] == item_name
        checkout[item_name][:count] -= coupon[:num]
      end
    end
  end

  coupons.each do |coupon|
    checkout["#{coupon[:item]} W/COUPON"] = {price: coupon[:cost], clearance: true, count: 1}
  end

  return checkout
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
