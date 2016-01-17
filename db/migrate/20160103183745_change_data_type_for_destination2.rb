class ChangeDataTypeForDestination2 < ActiveRecord::Migration
  def change
    change_column(:flights, :destination, :string)
  end
end
