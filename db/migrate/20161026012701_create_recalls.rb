class CreateRecalls < ActiveRecord::Migration[5.0]
  def up
    create_table :recalls do |t|
      t.integer :company_id
      t.string :product_description
      t.string :reason
      t.string :company_release_link
      t.datetime :release_date
      t.timestamps
    end
  end

  def down
    drop_table :recalls
  end
end
