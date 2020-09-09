class RemoveDetailFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :attribute, :string
  end
end
