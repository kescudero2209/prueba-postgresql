CREATE TABLE movies(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    year INTEGER
);

CREATE TABLE tags(
    id SERIAL PRIMARY KEY,
    tag VARCHAR(32)
);

 CREATE TABLE movies_tags(
    id SERIAL PRIMARY KEY,
    movies_id INTEGER,
    tags_id INTEGER,
    FOREIGN KEY(movies_id) REFERENCES movies(id),
    FOREIGN KEY(tags_id) REFERENCES tags(id)
);

INSERT INTO movies(name, year) VALUES 
('Star Wars',1977),
('Harry Potter y la piedra filosofal',2001),
('Matilda',1996),
('Titanic',1997),
('Grease',1978);

INSERT INTO tags(tag) VALUES
('Fantasía'),
('Ficción'),
('Infantil'),
('Acción'),
('Musical');

INSERT INTO movies_tags(movies_id,tags_id) VALUES
(1,1),
(1,2),
(1,4),
(2,2),
(2,3);


CREATE TABLE questions(
    id SERIAL PRIMARY KEY,
    question VARCHAR(255),
    correct_answer VARCHAR
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER CHECK (age > 18)
);

 CREATE TABLE answers(
    id SERIAL PRIMARY KEY,
    answer VARCHAR(255),
    user_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO questions(question, correct_answer) VALUES
    ('¿En qué mes estamos?','Noviembre'),
    ('¿Quién creó la insulina?','Frederick Banting y Charles Best'),
    ('¿Cuando se descubrió América?','14 de octubre 1492'),
    ('¿En qué mes empezó la segunda guerra mundial?','Septiembre'),
    ('¿Quién es el presidente de Chile?','Gabriel Boric');

INSERT INTO users(name, age) VALUES
('Andrés',28),
('Francisca',24),
('Luis',27),
('Ignacio',25),
('Fabian',26);

INSERT INTO answers(answer, question_id, user_id) VALUES
('Noviembre',1,1),
('Noviembre',1,2),
('Frederick Banting y Charles Best',2,3),
('15 de octubre 1492',3,4),
('Agosto',4,5);


3. SELECT movies.name, COUNT(movies_tags.movies_id) AS cantidad_tags FROM movies LEFT JOIN movies_tags ON movies.id = movies_tags.movies_id GROUP BY movies.id;

6. SELECT answers.user_id,count(correct_answer) AS resp_correctas FROM questions right JOIN answers ON answers.answer = questions.correct_answer GROUP BY answers.user_id;

7. SELECT questions.question, count(answers.answer) FROM questions LEFT JOIN answers on questions.correct_answer = answers.answer GROUP BY questions.question, answers.answer, questions.correct_answer;

10. ALTER TABLE users
ADD COLUMN
email VARCHAR;

ALTER TABLE users
  ADD CONSTRAINT UQ_USERS_EMAIL
  UNIQUE (email);






















