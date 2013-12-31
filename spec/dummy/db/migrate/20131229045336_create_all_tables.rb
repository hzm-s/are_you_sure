class CreateAllTables < ActiveRecord::Migration
  def change
    create_table :mounts do |t|
      t.string :name
    end

    create_table :mfrs do |t|
      t.string :name
    end

    create_table :lenses do |t|
      t.datetime :registered_at
      t.references :mfr
      t.references :mount
      t.string  :name
      t.integer :mm
      t.decimal :f, precision: 4, scale: 2
      t.boolean :close_up
      t.text    :note
    end
  end
end
