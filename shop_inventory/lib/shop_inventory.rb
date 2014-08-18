#!/usr/bin/ruby

require_relative 'shop_inventory/costumer.rb'
require_relative 'shop_inventory/shopkeeper.rb'

module ShopInventory

  def self.included(base)
    base.extend(AccessMethod)
  end
  
  module AccessMethod 
    def start_execution
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
    end
  end
end