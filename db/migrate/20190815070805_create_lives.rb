class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.string     :name, null: false
      t.date       :date
      t.string     :concept
      t.string     :target
      t.integer    :budget
      t.string      :image, default: ""

      t.timestamps
    end
  end
end
