_ = require 'underscore'

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
	_prepared_response = {}
	# Adds prepared `data` to the `_prepared_response`.
	# @param data - {Object} data to be added to the prepared response
	res.prepare = (data = {}) ->
		_.extend _prepared_response, data
	# `prepared` will return the prepared response
	res.__defineGetter__ 'prepared', -> _prepared_response
	# Move on to the next middleware
	next()

