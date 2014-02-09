describe 'Supremo', ->
  describe 'init', ->
    it 'creates instance of SupremoGetter as default value', ->
      App = Supremo.init({"Views": {}})
      App.__Views.should.be.an.instanceOf(Supremo.Getter)

    it 'sets url property to SupremoGetter value', ->
      data =
        url: "/spec/support/simple.js"
      App = Supremo.init({"Views": data})
      App.__Views.url.should.equal(data.url)

    it 'downloads js when accessed', ->
      data =
        url: "../support/simple.js"
      App = Supremo.init({"Answer": data})
      App.Answer.should.equal(42)
