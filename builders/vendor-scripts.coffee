module.exports = (grunt, rootDir, files) ->

  vendorPath = "#{rootDir}/dist/vendor/vendor_dev.js"

  vendorScriptFiles = {}
  vendorScriptFiles[vendorPath] = files

  grunt.config "clean.vendor-scripts", vendorPath

  grunt.config "concat.vendor-scripts", {
    files: vendorScriptFiles
  }

  grunt.registerTask "vendor-scripts", [
    "clean:vendor-scripts"
    "concat:vendor-scripts"
  ]