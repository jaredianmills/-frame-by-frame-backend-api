class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :project, foreign_key: true
      t.text :content
      t.float :timecode
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
