module.exports = function (api) {
  var validEnv = ["development", "test", "production"];
  var currentEnv = api.env();
  var isDevelopmentEnv = api.env("development");
  var isProductionEnv = api.env("production");
  var isTestEnv = api.env("test");

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      'Please specify a valid `NODE_ENV` or `BABEL_ENV` environment variables. Valid values are "development", "test", and "production". Instead, received: ' +
        JSON.stringify(currentEnv) +
        "."
    );
  }

  return {
    presets: [
      isTestEnv && [
        "@babel/preset-env",
        {
          targets: {
            node: "current",
          },
        },
      ],
      (isProductionEnv || isDevelopmentEnv) && [
        "@babel/preset-env",
        {
          forceAllTransforms: true,
          useBuiltIns: "entry",
          corejs: 3,
          modules: false,
          exclude: ["transform-typeof-symbol"],
        },
      ],
    ].filter(Boolean),
    plugins: [
      "@babel/plugin-syntax-dynamic-import",
      [
        "@babel/plugin-proposal-class-properties",
        {
          loose: true, // Ensure "loose" is only specified once
        },
      ],
      "@babel/plugin-proposal-private-methods",
      "@babel/plugin-proposal-private-property-in-object",
    ].filter(Boolean),
  };
};
