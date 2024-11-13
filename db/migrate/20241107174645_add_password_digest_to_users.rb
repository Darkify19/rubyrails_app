class AddPasswordDigestToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :password_digest, :string
  end
end
