class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string  :name
      t.boolean :is_default, default: true
      t.timestamps
    end
  end
end
