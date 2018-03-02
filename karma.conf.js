module.exports = function(config) {
  config.set({

    basePath: '',

    frameworks: ['mocha', 'chai'],

    // list of files / patterns to load in the browser
    files: [
      'app/javascript/packs/application.js',
      'spec/javascript/*.js'
    ],

    exclude: [
    ],

    preprocessors: {
      'app/javascript/packs/application.js': ['webpack'],
      'spec/javascript/test/': ['babel']
    },

    reporters: ['progress'],

    port: 9876,

    colors: true,

    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,

    autoWatch: true,

    browsers: ['Chrome', 'Firefox'],

    singleRun: false,

    concurrency: Infinity
  })
}
