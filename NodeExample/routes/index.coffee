
# GET users listing.
exports.index = (req, res) ->
  res.render 'index', sitetitle : 'MyWebsite'

exports.about = (req, res) ->
  console.log 'comming about'
  res.render 'index', sitetitle : 'About'
  