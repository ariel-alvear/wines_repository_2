class CreateEnologistMagazines < ActiveRecord::Migration[5.2]
  def change
    create_table :enologist_magazines do |t|
      t.references :enologist, foreign_key: true
      t.references :magazine, foreign_key: true

      t.timestamps
    end
  end
end
