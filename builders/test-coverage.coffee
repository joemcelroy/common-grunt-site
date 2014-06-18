path = require "path"

module.exports = (grunt, rootDir) ->

  grunt.config "karma.test-coverage", {
    configFile:"#{__dirname}/../configs/karma.coverage.conf.coffee"
    basePath: rootDir
    port: 8912
    coverageReporter:
      type : 'html'
      dir : "#{rootDir}/coverage/"
  }

  grunt.config "coffee.test-coverage", {
    expand: true
    cwd: "#{rootDir}/app/src"
    src: ["**/*.coffee"]
    dest: "dist/coverage-js"
    rename:(dest,matchedSource, opts)->
      return path.join(dest, matchedSource.replace(/coffee$/, "js"))
  }

  grunt.config "rename.test-coverage", {
    src: "#{rootDir}/coverage/PhantomJS**"
    dest: "#{rootDir}/coverage/PhantomJS/"
  }

  grunt.config "clean.test-coverage", "#{rootDir}/coverage/"
  grunt.config "clean.coverage-js", "#{rootDir}/dist/coverage-js/"


  grunt.registerTask "test-coverage", [
    "clean:coverage-js"
    "clean:test-coverage"
    "coffee:test-coverage"
    "karma:test-coverage"
    "rename:test-coverage"
  ]