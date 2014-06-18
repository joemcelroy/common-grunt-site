path = require "path"

module.exports = (grunt)->

  loadNpmTasks:()->
    cwd = process.cwd()
    process.chdir(path.join(__dirname, "../"))
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
    process.chdir(cwd)

  loadBuilder:(name, dir, files)->
    require("./#{name}")(grunt, dir, files)    

  loadTasks: (rootDir) ->
    @loadBuilder "coffeescript-app", rootDir
    @loadBuilder "vendor-scripts", rootDir
    @loadBuilder "test-unit", rootDir
    @loadBuilder "test-coverage", rootDir
    @loadBuilder "connect", rootDir
    @loadBuilder "sass", rootDir

    grunt.registerTask "dev", [
      "vendor-scripts"
      "coffeescript-app"
      "templates-app"
      "unit-tests"
      "connect:server"
      "watch"
    ]