module.exports = {
	extends: ["airbnb-base", "prettier"],
	rules: {
		indent: ["error", 4],
		"no-duplicate-imports": ["error", { includeExports: true }],
		"linebreak-style": 0,
		"import/no-unresolved": 0,
		"arrow-parens": 0,
		"consistent-return": 0,
		"object-curly-newline": 0,
		"no-unused-vars": 0,
		"no-underscore-dangle": 0,
		"prefer-const": [false, { destructuring: "all" }],
	},
};
