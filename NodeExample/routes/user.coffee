# GET users listing.
fs = require 'fs'

exports.list = (req, res) ->
  res.send 'respond with a resource'


exports.get = (req,res) -> 
  res.send "user id: #{req.params.id}"
  
exports.saveFile = (req,res) ->
  data = 'Some data I want to write to a file!'
  fs.writeFile "public\\file\\file.txt",data, (err)->
  	if !err
  	  console.log 'wrote data to file.txt'
  	  res.send 'wrote data to file.txt'
  	else
  	  throw err;
  