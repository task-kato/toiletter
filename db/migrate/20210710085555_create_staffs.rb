class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :nick_name, null: false # ニックネーム
      t.integer :gender, null: false, default: 1 # 0: 男性, 1: 女性
      t.string :email, null: false, unique: true # メールアドレス
      t.string :hashed_password # パスワード
      t.boolean :suspended, null: false, default: false # 停止フラグ
      t.boolean :admin, null: false, default: false # 管理者権限

      t.timestamps
    end
    add_index :staffs, :email, unique: true

  end
end
