class RemoveAdminFromUsers < ActiveRecord::Migration[5.0]
  def change
  	if column_exists?(:users, :admin)
  		remove_column :users, :admin
  	end
  end
end
