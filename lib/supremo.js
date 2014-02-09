(function() {
  window.Supremo = {
    init: function(options) {
      return new Supremo.Setter(options);
    },
    Setter: function(options) {
      var self;
      self = this;
      return _.each(options, function(value, key) {
        var akey;
        akey = "__" + key;
        self[akey] = new Supremo.Getter(value);
        self.__defineGetter__(key, function() {
          var v;
          v = self[akey];
          if (v instanceof Supremo.Getter) {
            v.download();
            return v;
          } else {
            console.log("Current value is " + self[akey]);
            return self[akey];
          }
        });
        return self.__defineSetter__(key, function(setv) {
          console.log("Current value is " + self[akey]);
          self[akey] = setv;
          return console.log("Setting value to " + setv);
        });
      });
    },
    Getter: function(options) {
      var self;
      self = this;
      _.each(options, function(value, key) {
        return self[key] = value;
      });
      self.download = function() {
        return console.log(self.url);
      };
      return self;
    }
  };

}).call(this);
