module.exports = (config) ->

  config.set

    basePath: "../../"

    frameworks: [
      'jasmine'
    ]

    files: [
      'dist/vendor_dev.js'
      '../i18n/MobileManager.resource.en-us.js'
      '../i18n/angular-locale_en-us.js'
      'assets/bower_components/angular-mocks/angular-mocks.js'
      'assets/bower_components/sinonjs/sinon.js'
      'dist/templates.js'
      'dist/app_dev.js'
      'test/unit/**/*.coffee'
    ]

    reporters: [
      'dots'
    ]

    browsers: [
      "PhantomJS"
    ]

    preprocessors:
      'test/unit/**/*.coffee': 'coffee'

    logLevel: config.LOG_WARN

    plugins: [
      'karma-chrome-launcher'
      'karma-phantomjs-launcher'
      'karma-jasmine'
      'karma-coffee-preprocessor'
    ]
