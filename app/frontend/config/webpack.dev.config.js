const path = require('path')

module.exports = {
  devtool: 'inline-source-map',
  entry: {
    modal: path.resolve(__dirname, '../src/javascripts/modal_menu.jsx'),
    swipe: path.resolve(__dirname, '../src/javascripts/swipe.jsx'),
    admin: path.resolve(__dirname, '../src/javascripts/admin.jsx'),
  },
  output: {
    path: path.resolve(__dirname, '../../assets/javascripts'),
    filename: '[name].js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel?presets[]=es2015'
      }
    ]
  }
}