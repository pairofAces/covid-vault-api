class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :active_cases
      t.integer :recovered_cases
      t.integer :deaths
      t.integer :total_cases

      t.timestamps
    end
  end
end
