class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.references   :user, null: false, foreign_key: true
      t.references   :live, null: false, foreign_key: true
      t.timestamps
    end
  end
end
