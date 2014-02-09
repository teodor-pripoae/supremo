module.exports = function(grunt) {
  grunt.initConfig({
    coffee: {
      compile: {
        files: {
          'lib/supremo.js': 'src/supremo.coffee',
          'spec/specs.js': ['spec/supremo/*.coffee']
        }
      }
    },
    mocha_phantomjs: {
      all: {
        options: {
          urls: [
            'http://localhost:8000/spec/html/main.html'
          ]
        }
      }
      // all: ['spec/html/*.html']
    },
    connect: {
      server: {
        options: {
          port: 8000,
          keepalive: true,
          livereload: true
        }
      }
    },
    watch: {
      coffee: {
        files: ['src/*.coffee', 'spec/**/*.coffee'],
        tasks: 'coffee'
      }
    }
  })
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-mocha-phantomjs');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-watch');
}
