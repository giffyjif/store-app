class DescriptionDataTypeChange < ActiveRecord::Migration
  def change
    change_column :products, :description, :string
  end
end
