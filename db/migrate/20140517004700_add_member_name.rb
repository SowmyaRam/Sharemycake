class AddMemberName < ActiveRecord::Migration
  def change
    add_column :f_name, :l_name, :string
  end
end
