class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.belongs_to :user
      t.belongs_to :client
      t.datetime :date
      t.boolean :positive
      t.boolean :payment
      t.boolean :appointment
      t.integer :rating
      t.boolean :blacklist

      t.timestamps
    end
  end
end
