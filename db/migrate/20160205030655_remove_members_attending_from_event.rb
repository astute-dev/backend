class RemoveMembersAttendingFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :members_attending, :string
  end
end
