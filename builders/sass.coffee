module.exports = (grunt, rootDir) ->

  grunt.config "clean.sass", "#{rootDir}/dist/*.css"

  grunt.config "compass.dev", {
    options:
      environment:"development"
      config: "#{rootDir}/assets/config.rb"
  }

  grunt.config "compass.release", {
    options:
      environment:"production"
      config: "#{rootDir}/assets/config.rb"
      force: true
  }

  grunt.config "autoprefixer.scss", {
    src: "#{rootDir}/dist/*.css"
  }

  grunt.config "watch.scss", {
    files: ["#{rootDir}/assets/styles/**/*.scss"]
    tasks:["sass"]
  }

  grunt.registerTask "sass", [
    "clean:sass"
    "compass:dev"
    "autoprefixer:scss"
  ]

