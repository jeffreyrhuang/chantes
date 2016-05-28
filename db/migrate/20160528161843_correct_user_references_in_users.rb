class CorrectUserReferencesInUsers < ActiveRecord::Migration
  def change
    remove_column(:reviews, :user_id)
    add_reference :reviews, :user, index: true
    add_foreign_key :reviews, :users
    add_index :reviews, [:user_id, :created_at]
  end
end
