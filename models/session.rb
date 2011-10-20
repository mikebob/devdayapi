class Session
	include MongoMapper::Document

	#key :speaker_id, ObjectId
	# key :room_id, ObjectId

	key :title, String, :required => true
	key :description, String, :required => true
	#key :time_slot, String, :required => true
	#key :room, String, :required => true
	key :room, Room

	# one :time_slot
	# one :room
	# one :room, :class_name => 'Room'
	belongs_to :speaker

	# accepts_nested_attributes_for :room

end