window.Supremo =
  init: (options) ->
    new Supremo.Setter(options)

  Setter: (options) ->
    self = @
    _.each options, (value, key) ->
      akey = "__#{key}"
      self[akey] = new Supremo.Getter(value)
      self.__defineGetter__ key, ->
        v = self[akey]
        if (v instanceof Supremo.Getter)
          v.download()
          return v
        else
          console.log("Current value is #{self[akey]}")
          return self[akey];

      self.__defineSetter__ key, (setv) ->
        console.log("Current value is #{self[akey]}")
        self[akey] = setv
        console.log("Setting value to #{setv}")
  Getter: (options) ->
    self = @
    _.each options, (value, key) ->
      self[key] = value

    self.download = ->
      console.log(self.url)
    self
