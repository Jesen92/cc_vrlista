class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :address
      t.string :vat

      t.timestamps null: false
    end
  end
end
