class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.text :info

      t.timestamps
    end
  end
end
