class CreateVenues < ActiveRecord::Migration
  def change
    create_table(:venues) do |venue|
      venue.column(:name, :string)

      venue.timestamps()
    end
  end
end
