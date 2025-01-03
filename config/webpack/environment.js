const { environment } = require("@rails/webpacker");

// Add an entry point if necessary

environment.loaders.append("babel", {
  test: /\.js$/,
  exclude: /node_modules/,
  use: {
    loader: "babel-loader",
    options: {
      presets: ["@babel/preset-env"],
    },
  },
});

environment.entry.set("application", "./app/javascript/packs/application.js");

module.exports = environment;
