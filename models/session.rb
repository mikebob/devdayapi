class Session
	include MongoMapper::Document

	key :speaker_id, ObjectId
	key :title, String, :required => true
	key :description, String, :required => true
	key :time_slot, Integer, :required => true
	key :room, String, :required => true

	belongs_to :speaker

end