class CreatePokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :pokemons do |t|
      t.integer :poke_index
      t.string :name, null: false
      t.string :type_1
      t.string :type_2
      t.integer :total
      t.integer :hp, null: false, default: 1
      t.integer :attack, null: false, default: 1
      t.integer :defense, null: false, default: 1
      t.integer :speed_attack, null: false, default: 1
      t.integer :speed_defense, null: false, default: 1
      t.integer :speed, null: false, default: 1
      t.integer :generation, null: false, default: 1
      t.boolean :legendary, null: false, default: false

      t.timestamps
    end
  end
end
