const html = require("html-template-tag");

module.exports = (books) => html`<!DOCTYPE html>
  <html>
    <head>
      <title>Dealers Choice: List View</title>
      <link rel="shortcut icon" href="#" />
      <link rel="stylesheet" href="/style.css" />
    </head>
    <body>
      <div class="container">
        <h2>
          Dealers Choice <br />
          Book List View
        </h2>
        <h3>Library</h3>
        <ul>
          ${books.map((book) => {
            return html` <li>
                <a href="/books/${book.id}">${book.title} <br /> </a>
                &emsp;&rdca;&emsp;By: ${book.first_name} ${book.last_name}
              </li>
              <p></p>`;
          })}
        </ul>
      </div>
      <script></script>
    </body>
  </html>`;
