class CreatePdfs < ActiveRecord::Migration[5.2]
  def change
    create_table :pdfs do |t|
      t.string :title
      t.string :author
      t.string :synopsis
      t.string :year

      t.timestamps
    end
  end
end
