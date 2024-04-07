class ChangeRolesToRoleInMember < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :role
    add_column :members, :role, :string
  end
end
