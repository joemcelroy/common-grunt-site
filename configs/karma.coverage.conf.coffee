module.exports = (config) ->

  config.set

    frameworks: [
      'jasmine'
    ]

    files: [
      'dist/locale-resources/en-us.js'
      'dist/vendor_dev.js'
      'dist/app_dev.js'
      'dist/templates_dev.js'

      'assets/bower_components/angular-mocks/angular-mocks.js'
      'assets/bower_components/sinonjs/sinon.js'

      'dist/coverage-js/**/*.module.js'
      'dist/coverage-js/**/*.js'

      'app/test/unit/**/*.coffee'
    ]

    exclude: [
      'dist/coverage-js/*-dev.js'
    ]

    reporters: [
      'dots','coverage'
    ]

    preprocessors:
      'app/test/unit/**/*.coffee': ['coffee']
      'dist/coverage-js/**/*.js': ['coverage']

    logLevel: config.LOG_ERROR

    browsers: ['PhantomJS']

    plugins: [
      'karma-coffee-preprocessor'
      'karma-phantomjs-launcher'
      'karma-coverage'
      'karma-jasmine'
    ]

    singleRun: true
    background: false
