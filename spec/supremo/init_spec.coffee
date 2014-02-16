describe 'Supremo', ->
  describe 'init', ->
    it 'creates instance of SupremoGetter as default value', ->
      App = Supremo.init({"Views": {url: "/something"}})
      App.__Views.should.be.an.instanceOf(Supremo.Getter)

    it 'sets url property to SupremoGetter value', ->
      data =
        url: "/spec/support/simple.js"
      App = Supremo.init({"Views": data})
      App.__Views.url.should.equal(data.url)

    it 'downloads js when accessed', ->
      data =
        url: "../support/simple.js"
      window.App = Supremo.init({"Answer": data})
      window.App.Answer.should.equal(42)

    it 'works with multiple files', ->
      data =
        Answer:
          url: "../support/simple.js"
        Complex:
          url: "../support/complex.js"
      window.App = Supremo.init(data)
      window.App.Complex().should.equal(42 + 10)

    it "works with multiple level files", ->
      data =
        Answer:
          url: "../support/simple.js"
        Complex:
          url: "../support/complex.js"
        Multiple:
          Level:
            url: "../support/multiple_level.js"
      window.App = Supremo.init(data)
      window.App.Multiple.Level().should.equal(42 + 10 + 20)
    it "works with closures", ->
      data =
        Views:
          Closured:
            url: "../support/closured.js"
      window.App = Supremo.init(data)
      window.App.Views.Closured().should.equal(422)

    it "works with string instead of hash", ->
      data =
        Answer: "../support/simple.js"
        Complex: "../support/complex.js"
      window.App = Supremo.init(data)
      window.App.Complex().should.equal(42 + 10)

    it "works with string variables", ->
      data =
        "comments/index": "../support/jst.js"
      window.JST = Supremo.init(data)
      window.JST["comments/index"]().should.equal("something")
