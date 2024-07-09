module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: ["eslint:recommended", "plugin:react/recommended"],
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: 12,
    sourceType: "module",
  },
  plugins: ["react"],
  rules: {
    "react/prop-types": "off",
    "react/react-in-jsx-scope": "off",
    "no-console": "warn",
    "no-debugger": "warn",
    "no-unused-vars": "warn",
    "react/jsx-uses-react": "off",
    "react/jsx-uses-vars": "warn",
    "react/display-name": "off",
  },
};
