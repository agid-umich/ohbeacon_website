class IncreaseUsersOauthTokenLength < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :oauth_token, :string, :limit => 5000
  end
end
