class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string    :nickname,        null: false
      t.string    :email,           null: false
      t.string    :password_digest, null: false
      t.string    :profile,         default: ""
      t.datetime  :birthday,        default: ""
      t.integer   :age,             default: ""
      t.integer   :gender,          default: ""
      t.string    :image,           default: ""
      t.timestamps
    end
  end
end
