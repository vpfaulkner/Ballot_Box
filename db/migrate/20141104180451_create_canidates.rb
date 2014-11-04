class CreateCanidates < ActiveRecord::Migration
  def change
    create_table :canidates do |t|
      t.string :name
      t.string :party

      t.timestamps
    end
  end
end
