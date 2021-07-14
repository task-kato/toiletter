class CreateToilets < ActiveRecord::Migration[6.1]
  def change
    create_table :toilets do |t|
      t.string :name, null: false, comment: '場所の名前'
      t.string :address, comment: '住所'
      t.float :latitude, comment: '緯度'
      t.float :longitude, comment: '経度'

      t.timestamps
    end
  end
end
