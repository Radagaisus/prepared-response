# Prepared Response

The `prepared_response` middleware adds a few utility functions that make it
easier to prepate data, over the course of several middlewares, to be used in
JSON responses.

Tested with ExpressJS 3.x

```
npm install prepared-response
```

![https://nodei.co/npm/prepared-response.png?downloads=true](https://nodei.co/npm/prepared-response.png?downloads=true)

[![build status](https://secure.travis-ci.org/Radagaisus/prepared-response.png)](http://travis-ci.org/Radagaisus/prepared-response)


```coffee
# Prepared Response
# -----------------------------------------------------------------------------------
# The `prepared_response` middleware adds a few utility functions that make it
# easier to prepate data, over the course of several middlewares, to be used in
# JSON responses.
# 
# - `res.prepare(data = {})` - Receives data and adds it to the prepared response.
# 
# - `res.prepared` - Returns the prepared data.
# 
# - `res._prepared_response` - Is used under the hood as the prepared response.
# 
# Example usage:
# 
#   get_user = (req, res, next) ->
#     res.prepare(user_id: req.param('id'))
#     User.get req.param('id'), (user) ->
#       req.user = user
#       next()
#   
#   respond = (req, res, next) ->
#     res.jsonp _.extend res.prepared,
#       code: 200
#       user: req.user
# 
#
module.exports = prepared_response = (req, res, next) ->
	# @private. The prepared response.
	res._prepared_response = {}
	# Adds prepared `data` to the `_prepared_response`.
	# @param data - {Object} data to be added to the prepared response
	res.prepare = (data = {}) ->
		_.extend _prepared_repsonse, data
	# `prepared` will return the prepared response
	req.__defineGetter__ 'prepared', -> req._prepared_response
```