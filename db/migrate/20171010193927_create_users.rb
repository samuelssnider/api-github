class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      
      t.string :user_name
      t.string :email
      t.string :image
      t.string :oauth_token
      
      t.string :login
      t.string :url

      t.timestamps
    end
  end
end
