class CreateBands < ActiveRecord::Migration
  def change
    create_table(:bands) do |band|
      band.column(:name, :string)

      band.timestamps()
    end
  end
end
