class AddColumnToLive < ActiveRecord::Migration[5.2]
  def change
    add_column  :lives, :start_time,   :date
    add_column  :lives, :open_time,    :date
    add_column  :lives, :place,        :string
    add_column  :lives, :price,        :integer
    add_column  :lives, :entertainers, :string
    add_column  :lives, :file_place,   :string
    add_column  :lives, :memo,         :string
  end
end
