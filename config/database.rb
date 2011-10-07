MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'devdayapi_development'
  when :production  then MongoMapper.database = 'devdayapi_production'
  when :test        then MongoMapper.database = 'devdayapi_test'
end
