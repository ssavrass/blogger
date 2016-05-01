class AddMonthName < ActiveRecord::Migration
  def change
    add_column :months, :name, :string
  end
end
