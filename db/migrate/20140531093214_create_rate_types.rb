class CreateRateTypes < ActiveRecord::Migration
  def change
    create_table :rate_types do |t|
      t.string :name
      t.integer :unit

      t.timestamps
    end
  end
end
