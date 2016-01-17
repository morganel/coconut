class ChangeDataTypeForDestination < ActiveRecord::Migration
  def change
  
    def self.up
    change_table :flight do |t|
      t.change :destination, :string
    end
  end
  def self.down
    change_table :flight do |t|
      t.change :destination, :datetime
    end
  end
  end
end
