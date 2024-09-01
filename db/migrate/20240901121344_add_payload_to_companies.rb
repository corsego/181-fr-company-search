class AddPayloadToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :payload, :json
    rename_column :companies, :info, :registration_number
  end
end
