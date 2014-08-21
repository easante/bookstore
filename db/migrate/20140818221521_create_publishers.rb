class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name, limit: 50

      t.timestamps
    end
  end
end
