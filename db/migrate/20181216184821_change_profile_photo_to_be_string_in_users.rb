class ChangeProfilePhotoToBeStringInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :profile_photo, :string
  end
end
