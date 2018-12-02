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
  cart.each do |item_name, details|
    if cart[item_name][:clearance] == true
      cart[item_name][:price] -= cart[item_name][:price] * 0.20
    end
  end
  return cart
end

def checkout(cart, coupons) #calculate total of consolidated cart
  # code here
  total = 0
  consolidated = consolidate_cart(cart)
  consolidated.each do |item_name, info|
    total += info[:price]
  end
  return total
end

# total = 0
# consolidated = consolidate_cart(cart) # this is the consolidate method stored into a variable
# coupons_applied = apply_coupons(consolidated, coupons) # applying coupons to to the consolidated cart
# clearance_applied = apply_clearance(coupons_applied)
# clearance_applied.each do |item_name, info|
#   info.each do |key, value|
#     total += info[:price] * info[:count]
#   end
# end
# if total > 100
#   total -= (total * 0.10)
# end
# return total
