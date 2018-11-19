# Initialize Mongo client
MongoDB = Mongo::Client.new('mongodb://dbmongo:27017/admin', user: 'root', password: 'example')
