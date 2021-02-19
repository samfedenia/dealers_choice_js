const html = require("html-template-tag");

module.exports = (book) => html`<!DOCTYPE html>
  <html>
    <head>
      <title>Dealers Choice: Detail View</title>
      <link rel="shortcut icon" href="#" />
      <link rel="stylesheet" href="/style.css" />
    </head>
    <body>
      <div class="container">
        <h2>
          Dealers Choice <br />
          Book Detail View
        </h2>
        <button><a href="/">Back to Library</a></button>
        <ul>
          <li><strong>Title:</strong> ${book.title}</li>
          <li><strong>Author:</strong> ${book.first_name} ${book.last_name}</li>
          <li><strong>Description:</strong> ${book.description}</li>
          <li><strong>Publisher:</strong> ${book.publisher_name}</li>
          <li><strong>Date Published:</strong> ${book.date_published}</li>
          <li><strong>ISBN:</strong> ${book.isbn}</li>
        </ul>
      </div>
    </body>
  </html>`;
