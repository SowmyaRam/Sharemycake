class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :email
      t.string :password_digest
      t.string :f_name
      t.string :l_name

      t.timestamps
    end
  end
end
