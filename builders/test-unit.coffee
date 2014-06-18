
module.exports = (grunt, rootDir) ->

  grunt.config "karma.unit-tests", {
    basePath: rootDir
    configFile:"#{__dirname}/../configs/karma.conf.coffee"
    singleRun: false
    background: true
  }

  grunt.config "watch.unit-tests", {
    files: ["#{rootDir}/app/test/**/*.coffee"]
    tasks: ["karma:unit-tests:run"]
    options:
      spawn: false
  }

  grunt.registerTask "unit-tests", [
    "karma:unit-tests"
  ]