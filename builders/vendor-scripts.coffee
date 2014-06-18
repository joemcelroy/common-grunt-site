module.exports = (grunt, rootDir) ->

  files = grunt.config.get("MicrositeConfig").vendorScripts

  vendorPath = "#{rootDir}/dist/vendor_dev.js"

  vendorScriptFiles = {}
  vendorScriptFiles[vendorPath] = files

  grunt.config "clean.vendor-scripts", vendorPath

  grunt.config "concat.vendor-scripts", {
    files: vendorScriptFiles
  }

  grunt.config "watch.vendor-scripts", {
    files: files
    tasks: ["vendor-scripts"]
    options: 
      spawn: false
  }

  grunt.registerTask "vendor-scripts", [
    "clean:vendor-scripts"
    "concat:vendor-scripts"
  ]