class Speaker
	include MongoMapper::Document

	key :name, String, :required => true
	key :bio, String, :required => true
	key :company, String
	key :photo_url, String

	many :sessions
	
end