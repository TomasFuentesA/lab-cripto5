class ChangeColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :pdfs, :title, :string
    remove_column :pdfs, :author, :string
    remove_column :pdfs, :synopsis, :string
    remove_column :pdfs, :year, :string

    add_column :pdfs, :ip, :string
    add_column :pdfs, :sistema_operativo, :string
    add_column :pdfs, :version, :string
    add_column :pdfs, :contraseña, :string

  end
end
