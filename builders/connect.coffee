module.exports = (grunt, rootDir) ->

  grunt.config "connect.server", {
    options:
      port: 9001
      base: "#{rootDir}"
      livereload: 35730
  }

  lrserver = require('tiny-lr')()

  lrserver.listen 35730, (err) -> 
    console.log('LR Server Started')

  grunt.task.registerTask "notifyCssChanges", "", () ->
    lrserver.changed({body: {files:['*.css']}})

  grunt.task.registerTask "notifyJSChanges", "", () ->
    lrserver.changed({body: {files:['*.js']}})