module.exports = (grunt, rootDir) ->

  grunt.config "connect.server", {
    options:
      port: 9001
      base: "#{rootDir}"
      livereload: true
  }