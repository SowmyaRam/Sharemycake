class CreateMembers < ActiveRecord::Migration
  def up
     drop_table :members
  end
   
  def down
    create_table :members do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
