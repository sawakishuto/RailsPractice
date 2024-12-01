class AddUserToPosts < ActiveRecord::Migration[6.1]
  def change
    # デフォルトのユーザーを作成
    default_user = User.create!(email: "swkshuto@icloud.com", password: "12345")

    # postsテーブルにuser_idカラムを追加（nullを許可し、デフォルト値を指定）
    add_reference :posts, :user, foreign_key: true, null: false, default: default_user.id

    # その後、デフォルト値を削除してカラムを通常の外部キーとして扱う
    end
end