const express = require("express");
const morgan = require("morgan");
const notFoundView = require("./views/notFoundView");
const booksRoute = require("./routes/books");
const app = express();

app.use(morgan("dev"));
app.use(express.static(__dirname + "/public"));

app.use("/books", booksRoute);

app.get("/", (req, res, next) => {
  res.redirect("/books");
});

app.use("/*", (req, res) => {
  throw new Error("Page Not Found");
});

app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(404);
  res.send(notFoundView());
});

const PORT = 1337;

app.listen(PORT, () => {
  console.log(`App listening in port ${PORT}`);
});
