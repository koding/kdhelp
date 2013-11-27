# 
# # Gruntfile
#
# We're using Grunt to compile our coffee source and remove Coffee as a
# dependency from KDHelp.
# 




module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    # Clean the build directory to ensure old code never sneaks in
    clean:
      build: ['build']

    # Compile our Coffee with grunt-contrib-coffee
    coffee:
      options:
        bare    : true
      all:
        expand  : true
        cwd     : './'
        dest    : 'build'
        ext     : '.js'
        src     : [
          'bin/**/*.coffee'
          'help/**/*.coffee'
        ]

    # grunt-contrib-copy copies our js file to the bin dir. See the JS file
    # for further explanation
    copy:
      bin:
        options:
          mode: true # Preserves executable mode
        expand  : true
        cwd     : './'
        dest    : 'build'
        src     : 'bin/**/*.js'

  # Load our plugins
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  # Register our tasks. For this project, it's only prepublish.
  grunt.registerTask 'build',       ['clean', 'coffee', 'copy']
  grunt.registerTask 'prepublish',  ['build']
  grunt.registerTask 'default',     ['build']

