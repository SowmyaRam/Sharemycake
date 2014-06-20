class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :orgn_title
      t.text :orgn_desc
      t.string :orgn_website
      t.string :orgn_image_url

      t.timestamps
    end
  end
end
