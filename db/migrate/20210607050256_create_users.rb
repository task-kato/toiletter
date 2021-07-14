class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nick_name, null: false, comment: 'ニックネーム'
      t.integer :gender, null: false, default: 1, comment: '0: 男性, 1: 女性'
      t.string :email, null: false, unique: true, comment: 'メールアドレス'
      t.string :hashed_password, comment: 'パスワード'
      t.boolean :suspended, null: false, default: false, comment: '停止フラグ'

      t.timestamps
    end
  end
end
