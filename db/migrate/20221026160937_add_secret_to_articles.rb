class AddSecretToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :secret, :text
  end
end
