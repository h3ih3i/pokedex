class CreatePokemons < ActiveRecord::Migration[8.0]
  TABLE_NAME = 'pokemons'

  def up
    return if ActiveRecord::Base.connection.table_exists?(TABLE_NAME)

    create_table TABLE_NAME do |t|
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

  def down
    return unless ActiveRecord::Base.connection.table_exists?(TABLE_NAME)
    drop_table TABLE_NAME
  end
end
