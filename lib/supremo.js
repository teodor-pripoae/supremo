(function() {
  window.Supremo = {
    init: function(options) {
      return new Supremo.Setter(options);
    },
    Setter: function(options) {
      var self;
      self = {};
      _.each(options, function(value, key) {
        var akey;
        if (_.isString(value.url)) {
          akey = "__" + key;
          self[akey] = new Supremo.Getter(value);
          self.__defineGetter__(key, function() {
            var v;
            v = self[akey];
            if (v instanceof Supremo.Getter) {
              v.download();
              return self[akey];
            } else {
              return self[akey];
            }
          });
          return self.__defineSetter__(key, function(setv) {
            return self[akey] = setv;
          });
        } else {
          return self[key] = Supremo.init(value);
        }
      });
      return self;
    },
    Getter: function(options) {
      var self;
      self = this;
      _.each(options, function(value, key) {
        return self[key] = value;
      });
      self.download = function() {
        var settings;
        settings = {
          type: "get",
          async: false
        };
        return $.ajax(self.url, settings);
      };
      return self;
    }
  };

}).call(this);
