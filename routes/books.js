// books route
const router = require("express").Router();
const listView = require("../views/listView");
const detailView = require("../views/detailView");
const { client } = require("../db");

const baseQuery = `SELECT books.id, books.title, books.description, books.date_published, books.isbn, authors.first_name, authors.last_name, publishers.name AS publisher_name
                  FROM books
                  JOIN authors
                      ON books.author_id = authors.id
                  JOIN publishers
                      ON books.publisher_id = publishers.id\n`;

router.get("/", async (req, res, next) => {
  try {
    const data = await client.query(baseQuery);
    const books = data.rows;
    res.send(listView(books));
  } catch (err) {
    next(err);
  }
});
router.get("/:bookid", async (req, res, next) => {
  try {
    const detailQuery = baseQuery + "WHERE books.id = ($1)";

    const data = await client.query(detailQuery, [req.params.bookid]);
    const book = data.rows[0];
    res.send(detailView(book));
  } catch (err) {
    next(err);
  }
});

module.exports = router;
