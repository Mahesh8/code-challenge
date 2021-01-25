class AddColorColumnToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :color, :string, default: '#28a745'
  end
end
