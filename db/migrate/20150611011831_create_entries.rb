class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :ndbno
      t.decimal :kcal
      t.decimal :protein
      t.decimal :fat
      t.decimal :carb
      t.string :unit
      t.string :servings

      t.timestamps null: false
      t.references :user 
    end
  end
end
