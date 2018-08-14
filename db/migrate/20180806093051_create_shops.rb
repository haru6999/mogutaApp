#shopというモデル（＝テーブル）が作られる
class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      # userモデルのuser_idに結びつけるため、必要
      t.integer :user_id, null: true
      #県
      t.text :prefecture, null: true
      #お店の名前
      t.text :name, null: false
      #日時
      #t.datetime :target_at, null: false
      t.datetime :target_at(1i), null: false
      t.datetime :target_at(2i), null: false
      t.datetime :target_at(3i), null: false
      t.datetime :target_at(4i), null: false
      t.datetime :target_at(5i), null: false

      #住所
      t.text :adress, null: true
      #最寄駅
      t.text :station, null: true
      #県
      t.string :prefecture, null: true
      #写真
      t.string :photo, null: true
      #値段
      t.integer :cost, null: true
      #美味しさ
      t.integer :taste, null: true
      #雰囲気
      t.integer :mood, null: true
      #メモ
      t.string :memo, null: true
      t.timestamps
    end
  end
end
