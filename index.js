// Generated by CoffeeScript 1.7.1
(function() {
  var prepared_response, _;

  _ = require('underscore');

  module.exports = prepared_response = function(req, res, next) {
    var _prepared_response;
    _prepared_response = {};
    res.prepare = function(data) {
      if (data == null) {
        data = {};
      }
      return _.extend(_prepared_response, data);
    };
    res.__defineGetter__('prepared', function() {
      return _prepared_response;
    });
    return next();
  };

}).call(this);
