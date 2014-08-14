$LOAD_PATH << "."

require "shop_inventory_module"
require "shop_inventory"

class Shopkeeper
  include ShopInventoryModule
  
  @shop_name
  @shopkeeper_name
  @product_name
  @price
  @stock_item
  @company_name
  @product_id
	
  def initialize
    @product_id=0
	  inventory_file=File.new("inventory.txt","a+")
	  inventory_file.close
	  temp_file=File.new("temp.txt","a+")
	  temp_file.close
  end

  def getter 
	  print "Enter the Name of Shop"
	  @shop_name=gets.chomp
  end

  def setter
	  return @shop_name
  end

  def shopkeeper_menu
	  answer='y'
	  while answer=='y' or answer=='Y' do
      puts "1. Add Product"
	    puts "2. Remove Product"
      puts "3. List all products"
	    puts "4. Search Product by name"
	    puts "5. Edit Product details"
	    puts "Select any option(1-5)"
	    option=gets.chomp
	    option=Integer(option)
	    if(option==1)
	      add_product
      elsif(option==2)
		    remove_product
	    elsif(option==3)
		    ShopInventoryModule.list_product
	    elsif(option==4)
		    ShopInventoryModule.search_product
	    elsif(option==5)
		    edit_product_details
	    else
		    puts "You have enterted the wrong choice"
	    end
	    puts "Do you want to select options again from menu?(Y/N)"
	    answer=gets.chomp
	  end
  end

  def add_product
    @product_id+=1
	  puts "Enter the Product Name :"		
	  @product_name=gets.chomp
	  puts "Enter the Price :"
	  @price =gets.chomp
	  puts "Enter the Stock Item :"
	  @stock_item =gets.chomp
	  puts "Enter the company name :"
	  @company_name=gets.chomp
	  inventory_file=File.open("inventory.txt","a")
	  if inventory_file
	    inventory_file.write(@product_id)
		  inventory_file.write(",")
		  inventory_file.write(@product_name)
		  inventory_file.write(",")
		  inventory_file.write(@price)
		  inventory_file.write(",")
		  inventory_file.write(@stock_item)
		  inventory_file.write(",")
		  inventory_file.write(@company_name)
		  inventory_file.write("\n")
	  else
		  puts "Unable to open file"
	  end
	  inventory_file.close
  end

  def remove_product
    print "Enter the product_id to remove Product :"
	  @product_id=gets.chomp
	  inventory_file=File.open("inventory.txt","r+")
	  temp_file=File.open("temp.txt","w+")
	  inventory_file.each_line do |line|
  	  split_line=line.split(",")
  	  unless split_line[0].eql?(@product_id)
  	    temp_file.write(line)
  	  end
    end
  	temp_file.close
  	inventory_file.close
  	temp_file=File.open("temp.txt","r+")
  	inventory_file=File.open("inventory.txt","w+")
  	temp_file.each_line do |line|
  	  inventory_file.write(line)
  	end
  	inventory_file.close
  	temp_file.close
  end

  def edit_product_details
    product_search_flag=0
	  puts "Enter the product_id to edit its details"
	  @product_id=gets.chomp
	  puts "Enter the Product Name :"		
	  @product_name=gets.chomp
	  puts "Enter the Price :"
	  @price =gets.chomp
	  puts "Enter the Stock Item :"
	  @stock_item =gets.chomp
	  puts "Enter the company name :"
	  @company_name=gets.chomp
	  inventory_file=File.open("inventory.txt","r+")
	  temp_file=File.open("temp.txt","w+")
	  inventory_file.each_line do |line|
  	  split_line=line.split(",")
  	  if split_line[0].eql?(@product_id)
  	    temp_file.write("#{@product_id},#{@product_name},#{@price},#{@stock_item},#{@company_name}")
  		  product_search_flag = 1
  	  else
  		  temp_file.write(line)
  	  end
  	end
  	temp_file.close
  	inventory_file.close
  	if product_search_flag==1
  	  temp_file=File.open("temp.txt","r+")
  	  inventory_file=File.open("inventory.txt","w+")
  	  temp_file.each_line do |line|
  	    inventory_file.write(line)
  	  end
  	  inventory_file.close
  	  temp_file.close
  	else	
  	  puts "Product_id not found"
  	end
  end
end