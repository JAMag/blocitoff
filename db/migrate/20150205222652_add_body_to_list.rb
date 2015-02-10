class AddBodyToList < ActiveRecord::Migration
  def change
    add_column :lists, :body, :text
  end
end
