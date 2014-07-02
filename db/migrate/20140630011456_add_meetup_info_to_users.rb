class AddMeetupInfoToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :service_avatar
    add_column :users, :name, :string
  end
end
