# connection to zee database

module Connect
  CONN = PG::Connection.new({
    host: 'localhost',
    dbname: 'contactlist',
    user: 'development',
    password: 'development'
  })
end
