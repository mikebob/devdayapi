class Speaker
	include MongoMapper::Document

	key :name, String, :required => true
	key :bio, String, :required => true
	key :company, String

	many :sessions
	
end