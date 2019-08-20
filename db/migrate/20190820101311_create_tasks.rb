class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer     :kind
      t.string      :content, null: false
      t.date        :start_date
      t.date        :finish_date
      t.boolean     :finish, default: false, null: false
      t.string      :memo
      t.references  :user, null: false, foreign_key: true
      t.references  :live, null: false, foreign_key: true
      t.timestamps
    end
  end
end
