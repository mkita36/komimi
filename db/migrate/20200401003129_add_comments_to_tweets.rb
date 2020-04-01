class AddCommentsToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :comment, :text
  end
end
