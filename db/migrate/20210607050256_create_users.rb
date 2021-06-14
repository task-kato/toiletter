class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false # 名前
      t.string :name_kana, null: false # 名前（カナ）
      t.string :nick_name, null: false # ニックネーム
      t.integer :gender, null: false, default: 1 # 1: 男性, 2: 女性
      t.string :email, null: false, unique: true # メールアドレス
      t.string :hashed_password # パスワード
      t.boolean :suspended, null: false, default: false # 停止フラグ

      t.timestamps
    end
  end
end
