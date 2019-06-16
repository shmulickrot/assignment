class ChangeStatusToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :content_items, :status, 'integer USING CAST(status AS integer)'
  end
end
