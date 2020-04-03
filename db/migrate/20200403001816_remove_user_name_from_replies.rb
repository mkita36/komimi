class RemoveUserNameFromReplies < ActiveRecord::Migration[6.0]
  def change
    remove_column :replies, :user_name, :string
  end
end