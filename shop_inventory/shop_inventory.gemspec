Gem::Specification.new do |s|
	s.name			= 'shop_inventory'
	s.version		= '0.0.1'
	s.date			= '2014-08-14'
	s.summary		= 'Shop Inventory Gem'
	s.description	= "This is a Shop Inventory Gem for 1. costumer to buy product ,list all products and search any particular product. 2. ShopKeeper to sell products , edit details of products , search and list all the products"
	s.author		= ["Palash Kulkarni"]
	s.email			= 'kulkarnipalash@gmail.com'
	s.files			= ["lib/shop_inventory.rb", "lib/shop_inventory/shop_inventory_module.rb", "lib/shop_inventory/shopkeeper.rb", "lib/shop_inventory/costumer.rb", "bin/shop_inventory.rb"]
	s.executables	= ["shop_inventory.rb"]
end