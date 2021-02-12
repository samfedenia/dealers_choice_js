// notFoundView.js
const html = require("html-template-tag");

module.exports = () => html`<!DOCTYPE html>
  <html>
    <head>
      <title>Dealers Choice</title>
      <link rel="shortcut icon" href="#" />
      <link rel="stylesheet" href="/style.css" />
    </head>
    <body>
      <header></header>
      <div class="not-found">
        <p>Page Not Found</p>
      </div>
    </body>
  </html>`;
