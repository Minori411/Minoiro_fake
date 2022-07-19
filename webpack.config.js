const path    = require("path")
const webpack = require("webpack")

module.exports = {
  resolve: {
    modules: ['node_modules'],
    modules: ['components']
  },
  mode: "production",
  devtool: "source-map",
  
  entry: {
    application: "./app/javascript/application.js"
  },
  output: {
    filename: "[name].js",
    sourceMapFilename: "[file].map",
    path: path.resolve(__dirname, "app/assets/builds"),
  },
  plugins: [
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1
    })
  ]
  
}
