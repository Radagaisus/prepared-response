assert = require 'assert'
prepared_response = require '../index'

describe 'prepared-response', ->
	
	it 'works', ->

		req = {}
		res = {}

		prepared_response req, res, ->

			res.prepare(hello: 'hi')
			res.prepare(what: {'is': 'this'})

			assert.equal res.prepared.hello, 'hi'
			assert.equal res.prepared.what.is, 'this'

	

