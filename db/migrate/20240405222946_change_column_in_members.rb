class ChangeColumnInMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :roles
    add_column :members, :role, :string
  end
end
