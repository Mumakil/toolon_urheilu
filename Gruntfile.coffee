spawn = require('child_process').spawn

module.exports = (grunt) ->
	
  grunt.initConfig 
    pkg: grunt.file.readJSON 'package.json'

  grunt.registerTask 'server', 'Runs the webserver', (port) ->
    done = @async()
    grunt.log.writeln "Firing up webserver"
    server = spawn './node_modules/.bin/norman', [], 
      cwd: __dirname
      env: process.env
    server.stdout.on 'data', (data) ->
      grunt.log.write data
    server.stderr.on 'data', (data) ->
      grunt.log.error data
    server.on 'close', (code) ->
      grunt.log.writeln "Server exited with code #{code}"
      done(code == 0)



