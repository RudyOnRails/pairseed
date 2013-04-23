class AddLogoImageToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :logo_image, :string
  end
end
