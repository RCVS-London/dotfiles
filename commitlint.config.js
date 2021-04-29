/* eslint-disable @typescript-eslint/no-magic-numbers, unicorn/prefer-module */

module.exports = {
    extends: ["@commitlint/config-conventional"],
    rules: {
        "body-max-line-length": [1, "always", 100],
        "footer-max-line-length": [1, "always", 100],
        "subject-case": [0],
    },
};
