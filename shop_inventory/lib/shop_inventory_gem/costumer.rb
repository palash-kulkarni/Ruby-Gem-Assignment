#!/usr/bin/ruby
$LOAD_PATH << "."

require "shop_inventory_module"
require "shop_inventory"

class Costumer
  include ShopInventoryModule

  def initialize 
    inventory_file=File.new("inventory.txt","a+")
    inventory_file.close
    temp_file=File.new("temp.txt","a+")
    temp_file.close
    order_file=File.new("inventory.txt","a+")
    order_file.close
  end

  def getter
    print "Enter the Name of customer :"
    costumer_name=gets.chomp
  end

  def setter
    return costumer_name
  end

  def costumer_menu
    answer='y'
    while answer=='y' or answer=='Y' do
      puts "1. List Products" 
      puts "2. Search Product"
      puts "3. Buy Product"
      print "Enter the option(1-3) :"
      option=gets.chomp
      option=Integer(option)
      if(option==1)
        ShopInventoryModule.list_product
      elsif(option==2)
        ShopInventoryModule.search_product
      elsif(option==3)
        buy_product
      else
        puts "You have enterted the wrong choice"
      end
      puts "Do you want to select options again from menu?(Y/N)"
      answer=gets.chomp
    end
  end

  def buy_product
    product_search_flag=0
    
    print "Enter the Product_id :"
    product_id=gets.chomp
    inventory_file=File.open("inventory.txt","r+")
    temp_file=File.open("temp.txt","w+")
    inventory_file.each_line do |line|
      split_line=line.split(",")
      unless split_line[0].eql?(product_id)
        temp_file.write(line)
      end
      if split_line[0].eql?(product_id)
        flag=1
        new_line=check_manipulate_product(product_id,line)
        temp_file.write(new_line)
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
      print "Enter the Costumer name:"
      costumer_name=gets.chomp
      print "Enter the Credit card number :"
      card_number=gets.chomp
      print "Enter the cvv :"
      cvv=gets.chomp
      order_file=File.open("order.txt","a")
      order_file.write("#{product_id},#{costumer_name},#{card_number},#{cvv}\n")
      puts "Product is unavailable"
  end

  def check_manipulate_product(product_id,line)
    new_line=""
    inventory_file=File.open("inventory.txt","r+")
    temp_file=File.open("temp.txt","a+")
    inventory_file.each_line do |line|
      split_line=line.split(",")
      if split_line[0].eql?(product_id)
        stock_number=Integer(split_line[3])
        stock_number-=1
      end
      new_line="#{split_line[0]},#{split_line[1]},#{split_line[2]},#{stock_number},#{split_line[4]}"
    end
    return new_line
  end
end