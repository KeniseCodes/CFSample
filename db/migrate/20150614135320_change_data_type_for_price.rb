class ChangeDataTypeForPrice < ActiveRecord::Migration
  def change
  		change_table :products do |t|
      t.change :price, :float
    end
  end
end
