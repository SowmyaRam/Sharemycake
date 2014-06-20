class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :member_id
      t.string :event_name
      t.string :event_desc
      t.string :venue
      t.datetime :event_date
      t.string :event_status
      t.integer :orgn_id
      t.integer :contr_percent
      t.string :template_id
      t.string :email_id
      t.string :email_message

      t.timestamps
    end
  end
end
