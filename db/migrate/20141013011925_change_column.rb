class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :posts, :post_count, :integer, :default => 0
  end
end
