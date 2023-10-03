class CreateContractors < ActiveRecord::Migration[7.0]
  def change
    create_table :contractors do |t|
      t.string :name
      t.decimal :salary
      t.decimal :total

      t.timestamps
    end
  end
end
