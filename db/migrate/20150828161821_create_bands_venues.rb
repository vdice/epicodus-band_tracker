class CreateBandsVenues < ActiveRecord::Migration
  def change
    create_table(:bands_venues) do |bv|
      bv.column(:band_id, :int)
      bv.column(:venue_id, :int)

      bv.timestamps()
    end
  end
end
