path = require "path"

module.exports = (grunt)->

  loadNpmTasks:()->
    cwd = process.cwd()
    process.chdir(path.join(__dirname, "../"))
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
    process.chdir(cwd)

  loadBuilder:(name, dir, files)->
    require("./#{name}")(grunt, dir, files)