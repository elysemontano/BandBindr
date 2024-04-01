class AddLastUsedOrgIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_used_organization_id, :integer
  end
end
