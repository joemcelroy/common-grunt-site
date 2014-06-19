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

  grunt.config "clean.templates", "#{rootDir}/dist/templates_dev.js"

  grunt.config "html2js.app", {
    src: ["#{rootDir}/app/src/**/*.html"]
    dest: "#{rootDir}/dist/templates_dev.js"
    options:
      base: "#{rootDir}/app/src"
      module:"templates-client"
  }

  grunt.config "watch.coffeescript-app", {
    files: ["#{rootDir}/app/src/**/*.coffee"]
    tasks: ["coffeescript-app", "notifyJSChanges", "karma:unit-tests:run"]
    options: 
      spawn: false
  }

  grunt.config "watch.templates-app", {
    files: ["#{rootDir}/app/**/*.html"]
    tasks: ["html2js:app", "notifyJSChanges", "karma:unit-tests:run"]
    options: 
      spawn: false
  }

  grunt.registerTask "templates-app", [
    "clean:templates"
    "html2js:app"
  ] 

  grunt.registerTask "coffeescript-app", [
    "clean:app"
    "coffee:app"
  ]