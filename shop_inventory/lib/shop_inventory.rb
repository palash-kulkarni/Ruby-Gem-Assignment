require 'shop_inventory_gem/costumer'
require 'shop_inventory_gem/shopkeeper'

puts "Are you a costumer or a shopkeeper?"
puts "1. Costumer"
puts "2. Shopkeeper"
print "select option 1 or 2 :"
user=gets.chomp
user=Integer(user)
if user==1
  costumer_obj=Costumer.new
  costumer_obj.costumer_menu
elsif user==2
  shopkeeper_obj=Shopkeeper.new
  shopkeeper_obj.shopkeeper_menu
else 
  puts "You have entered a wrong choice..!"
end