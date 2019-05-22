class AddAuthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expieres_at, :datetime
  end
end
