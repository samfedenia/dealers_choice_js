--dealers_choice_db seed file

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors, publishers;

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name TEXT DEFAULT NULL,
  last_name TEXT DEFAULT NULL
);

CREATE TABLE publishers (
  id SERIAL PRIMARY KEY,
  name TEXT DEFAULT NULL
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  author_id INTEGER REFERENCES authors(id) NOT NULL,
  publisher_id INTEGER REFERENCES publishers(id) NOT NULL,
  title VARCHAR(255) DEFAULT NULL,
  description TEXT DEFAULT NULL,
  date_published SMALLINT DEFAULT 2021,
  isbn VARCHAR(13)
);

INSERT INTO authors (first_name, last_name) VALUES ('Ernest', 'Hemingway');
INSERT INTO authors (first_name, last_name) VALUES ('Mark', 'Twain');
INSERT INTO authors (first_name, last_name) VALUES ('Virginia', 'Woolf');
INSERT INTO authors (first_name, last_name) VALUES ('J.K.', 'Rowling');

INSERT INTO publishers (name) VALUES ('Scribner'); -- farewell to arms
INSERT INTO publishers (name) VALUES ('Chatto & Windus'); -- Huckleberry Finn
INSERT INTO publishers (name) VALUES ('Hogarth Press'); -- Room of One's Own	
INSERT INTO publishers (name) VALUES ('Bloomsbury'); -- Harry Potter	

INSERT INTO books (author_id, publisher_id, title, description, date_published, isbn) VALUES ((SELECT id FROM authors WHERE last_name='Hemingway'), (SELECT id FROM publishers WHERE name='Scribner'), 'A Farewell To Arms', 'A Farewell to Arms is a novel by American writer Ernest Hemingway, set during the Italian campaign of World War I. First published in 1929, it is a first-person account of an American, Frederic Henry, serving as a lieutenant ("tenente") in the ambulance corps of the Italian Army. The title is taken from a poem by the 16th-century English dramatist George Peele.', 1929, 9780020519003);
INSERT INTO books (author_id, publisher_id, title, description, date_published, isbn) VALUES ((SELECT id FROM authors WHERE last_name='Hemingway'), (SELECT id FROM publishers WHERE name='Scribner'), 'The Sun Also Rises', 'The Sun Also Rises is a 1926 novel by American writer Ernest Hemingway, his first, that portrays American and British expatriates who travel from Paris to the Festival of San Fermín in Pamplona to watch the running of the bulls and the bullfights. An early and enduring modernist novel, it received mixed reviews upon publication. However, Hemingway biographer Jeffrey Meyers writes that it is now recognized as Hemingways greatest work and Hemingway scholar Linda Wagner-Martin calls it his most important novel.[3] The novel was published in the United States in October 1926 by Scribners. A year later, Jonathan Cape published the novel in London under the title Fiesta. It remains in print.', 1926, 9780020518709);
INSERT INTO books (author_id, publisher_id, title, description, date_published, isbn) VALUES ((SELECT id FROM authors WHERE last_name='Twain'), (SELECT id FROM publishers WHERE name='Chatto & Windus'), 'Adventures of Huckleberry Finn', 'Adventures of Huckleberry Finn (or, in more recent editions, The Adventures of Huckleberry Finn) is a novel by Mark Twain, first published in the United Kingdom in December 1884 and in the United States in February 1885. Commonly named among the Great American Novels, the work is among the first in major American literature to be written throughout in vernacular English, characterized by local color regionalism. It is told in the first person by Huckleberry "Huck" Finn, the narrator of two other Twain novels (Tom Sawyer Abroad and Tom Sawyer, Detective) and a friend of Tom Sawyer. It is a direct sequel to The Adventures of Tom Sawyer.', 1885, 9780470152874);
INSERT INTO books (author_id, publisher_id, title, description, date_published, isbn) VALUES ((SELECT id FROM authors WHERE last_name='Woolf'), (SELECT id FROM publishers WHERE name='Hogarth Press'), 'A Room of One''s Own', 'A Room of One''s Own is an extended essay by Virginia Woolf, first published in September 1929.[1] The work is based on two lectures Woolf delivered in October 1928 at Newnham College and Girton College, women''s constituent colleges at the University of Cambridge.[2][3] An important feminist text, the essay argues for both a literal and figurative space for women writers within a literary tradition dominated by men. In her essay, Woolf uses metaphors to explore social injustices and comments on women’s lack of free expression. Her metaphor of a fish explains her most essential point, “A woman must have money and a room of her own if she is to write fiction”.[2] She writes of a woman whose thought had “let its line down into the stream”.[4] As the woman starts to think of an idea, a guard enforces a rule whereby women are not allowed to walk on the grass. Abiding by the rule, the woman loses her idea. Here, Woolf describes the influence of women''s social expectations as mere domestic child bearers, ignorant and chaste. The control of literature has been granted to men as a consequence of this patriarchal domination.', 1929, 9780631180371);
INSERT INTO books (author_id, publisher_id, title, description, date_published, isbn) VALUES ((SELECT id FROM authors WHERE last_name='Rowling'), (SELECT id FROM publishers WHERE name='Chatto & Windus'), 'Harry Potter and the Sorcerer''s Stone', 'Harry Potter and the Philosopher''s Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling''s debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry. Harry makes close friends and a few enemies during his first year at the school, and with the help of his friends, he faces an attempted comeback by the dark wizard Lord Voldemort, who killed Harry''s parents, but failed to kill Harry when he was just 15 months old.', 1997, 0747532699);
