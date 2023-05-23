class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :event_type
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
