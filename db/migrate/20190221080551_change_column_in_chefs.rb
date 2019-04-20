class ChangeColumnInChefs < ActiveRecord::Migration[5.2]
  def change
  	rename_column :chefs, :name, :chefname
  	change_column :chefs, :chefname, :string
  end
end
