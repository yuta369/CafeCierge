const path = require('path');

module.exports = {
  resolve: {
    alias: {
      '@fortawesome/fontawesome-free': path.resolve(__dirname, '../../node_modules/@fortawesome/fontawesome-free')
    }
  }
};