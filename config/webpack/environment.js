const { environment } = require('@rails/webpacker')

// Added by Hassaaan to application understand jquery and popper.js
const webpack = require("webpack")
environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js','default']
}))
// End added by Hassaaan to application understand jquery and popper.js

module.exports = environment
