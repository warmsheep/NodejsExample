# GET users listing.

exports.list = (req, res) ->
  res.send 'respond with a resource'


exports.get = (req,res) -> 
  res.send "user id: #{req.params.id}"
  