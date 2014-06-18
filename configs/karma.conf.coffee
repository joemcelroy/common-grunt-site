module.exports = (config) ->

  config.set
    files: [
      'dist/locale-resources/en-us.js'
      'dist/vendor_dev.js'
      'dist/app_dev.js'
      'dist/templates_dev.js'

      'assets/bower_components/angular-mocks/angular-mocks.js'
      'assets/bower_components/sinonjs/sinon.js'

      'app/test/unit/**/*.coffee'
    ]

    frameworks: [
      'jasmine'
    ]

    reporters: [
      'dots'
    ]

    browsers: [
      "PhantomJS"
    ]

    plugins: [
      'karma-chrome-launcher'
      'karma-phantomjs-launcher'
      'karma-jasmine'
      'karma-coffee-preprocessor'
    ]