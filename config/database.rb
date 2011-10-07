
case Padrino.env
  when :development then 
		MongoMapper.database = 'devdayapi_development'
		MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)
  when :production  then MongoMapper.database = 'devdayapi_production'
		MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com',10034, :logger => logger)
		MongoMapper.database = 'onedevdaytogo'
		MongoMapper.database.authenticate('dbuser','doworkson')		
  when :test        then MongoMapper.database = 'devdayapi_test'
end
