class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string :data_type
      t.string :value
      t.integer :user_id
      t.timestamps
    end
  end
end
