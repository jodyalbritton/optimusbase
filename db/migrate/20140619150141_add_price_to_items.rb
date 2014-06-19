class AddPriceToItems < ActiveRecord::Migration
  def change
  	add_column :items, :price, :decimal, :precision => 8, :scale => 2
  	change_column :items, :cost, :decimal, :precision => 8, :scale => 2
  end
end
