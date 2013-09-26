

express = require 'express'
routes = require './routes'
mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/todo_development',(err)->
  if !err
    console.log 'connected to MongoDB!'
  else
    throw err

user = require './routes/user'
http = require 'http'
path = require 'path'

app = express();

# all environments
app.set 'port', process.env.PORT || 3000
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static path.join(__dirname, 'public')

# development only
if 'development' == app.get('env')
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/users', user.list
app.get '/about', routes.about
app.post '/users/listAll',(req,res) ->
	res.send(req.body)
	
app.get '/user/:id', user.get
app.get '/saveFile', user.saveFile
app.get '/readFile', user.readFile
app.get '/readEnv', user.readEnv

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')

