class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :eventURL
      t.string :eventID
      t.datetime :eventTime
      t.string :eventName
      t.string :eventDescription
      t.string :eventOrganizerID
      t.string :eventOrganizerName
      t.string :eventLocation
      t.string :eventVenueID
      t.string :eventVenueName
      #later, another table for organizerID->Name and venueID->Name?
      t.timestamps
    end
  end
end
