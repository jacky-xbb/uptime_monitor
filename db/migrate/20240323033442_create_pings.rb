class CreatePings < ActiveRecord::Migration[7.1]
  def change
    create_table :pings do |t|
      t.references :domain, null: false, foreign_key: true
      t.integer :response_time
      t.boolean :alive

      t.timestamps
    end
  end
end
