module.exports = (grunt, rootDir) ->

  grunt.config "clean.app", "#{rootDir}/dist/app_dev.js"

  grunt.config "coffee.app", {
    files:
      "dist/app_dev.js":[
        "#{rootDir}/app/src/**/index*.coffee",
        "#{rootDir}/app/src/**/*.module.coffee",
        "#{rootDir}/app/src/**/*.coffee"
      ]
  }

  grunt.registerTask "coffeescript-app", [
    "clean:app"
    "coffee:app"
  ]