class ChangeLiveColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column  :lives, :start_time, :time
    change_column  :lives, :open_time, :time
  end
end
