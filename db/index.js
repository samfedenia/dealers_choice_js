const pg = require("pg");

const client = new pg.Client("postgres://localhost/dealers_choice_db");

const makeDBConnection = async () => {
  try {
    await client.connect();
    console.log("connected to database");
  } catch (err) {
    console.error(err);
  }
};

makeDBConnection();

module.exports = { client };
