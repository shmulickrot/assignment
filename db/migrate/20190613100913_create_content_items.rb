class CreateContentItems < ActiveRecord::Migration[5.0]
  def change
    create_table :content_items do |t|
      t.string :title
      t.datetime :published_date
      t.string :author
      t.string :summary
      t.string :content
      t.integer :status

      t.timestamps
    end
  end
end
