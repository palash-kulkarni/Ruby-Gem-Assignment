#!/usr/bin/ruby
require_relative '../lib/shop_inventory.rb'
class BeginExecution
	include ShopInventory
	def self.begin_execution
		self.start_execution
	end
end
BeginExecution.begin_execution