class AddHashTagToProject < ActiveRecord::Migration
  def change
    add_column :projects, :hashtag, :string
  end
end
