class CreateUserSongs < ActiveRecord::Migration
  def change
    create_table :user_songs do |t|
      t.references :user, index: true
      t.references :song, index: true

      t.timestamps
    end
  end
end
