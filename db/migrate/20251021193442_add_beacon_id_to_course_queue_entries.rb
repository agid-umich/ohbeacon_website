class AddBeaconIdToCourseQueueEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :course_queue_entries, :beacon_id, :string
  end
end
