class CreateWineEnologists < ActiveRecord::Migration[5.2]
  def change
    create_table :wine_enologists do |t|
      t.references :wine, foreign_key: true
      t.references :enologist, foreign_key: true

      t.timestamps
    end
  end
end
