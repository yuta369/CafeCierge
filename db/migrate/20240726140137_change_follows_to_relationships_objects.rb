class ChangeFollowsToRelationshipsObjects < ActiveRecord::Migration[6.1]
  def change
    rename_table :follows, :relationships
  end
end
