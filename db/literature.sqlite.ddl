PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS "actor" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  "name" varchar(255) NOT NULL
,  "born" datetime DEFAULT NULL
,  "died" datetime DEFAULT NULL
,  "imdb" char(15) DEFAULT NULL
,  "slug" varchar(255) DEFAULT NULL
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE INDEX idx_actor_name ON actor(name);
CREATE TABLE IF NOT EXISTS "actor_role" (
  "actor" integer NOT NULL
,  "production" integer NOT NULL
,  "character" integer NOT NULL
,  "name" varchar(100) DEFAULT NULL
,  PRIMARY KEY ("actor","production","character")

,  FOREIGN KEY ("actor") REFERENCES "actor" ("id") ON DELETE CASCADE ON UPDATE CASCADE
,  FOREIGN KEY ("production") REFERENCES "production" ("id") ON DELETE CASCADE ON UPDATE CASCADE
,  FOREIGN KEY ("character") REFERENCES "character" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX idx_actor_role_production ON actor_role(production);
CREATE INDEX idx_actor_role_character ON actor_role(character);
CREATE TABLE IF NOT EXISTS "author" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  "name" varchar(255) NOT NULL
,  "born" datetime DEFAULT NULL
,  "died" datetime DEFAULT NULL
,  "imdb" char(15) NOT NULL
,  "slug" varchar(255) DEFAULT NULL
);
CREATE INDEX idx_author_name ON author(name);
CREATE TABLE IF NOT EXISTS "author_work" (
  "author" integer NOT NULL
,  "work" integer NOT NULL
,  PRIMARY KEY ("author","work")

,  FOREIGN KEY ("author") REFERENCES "author" ("id") ON DELETE CASCADE ON UPDATE CASCADE
,  FOREIGN KEY ("work") REFERENCES "work" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX idx_author_work_work ON author_work(work);
CREATE TABLE IF NOT EXISTS "character" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  "name" varchar(255) NOT NULL
,  "slug" varchar(255) DEFAULT NULL
);
CREATE TABLE IF NOT EXISTS "character_appearance" (
  "character" integer NOT NULL
,  "work" integer NOT NULL
,  PRIMARY KEY ("character","work")

,  FOREIGN KEY ("character") REFERENCES "character" ("id") ON DELETE CASCADE ON UPDATE CASCADE
,  FOREIGN KEY ("work") REFERENCES "work" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX idx_character_appearance_work ON character_appearance(work);
CREATE TABLE IF NOT EXISTS "production" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  "title" varchar(255) DEFAULT NULL
,  "work" integer NOT NULL
,  "year" year(4) DEFAULT NULL
,  "made_by" varchar(255) DEFAULT NULL
,  "slug" varchar(255) DEFAULT NULL
,  "type" text  DEFAULT NULL

,  FOREIGN KEY ("work") REFERENCES "work" ("id")
);
CREATE INDEX idx_production_work ON production(work);
CREATE TABLE IF NOT EXISTS "production_product" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  "production_id" integer NOT NULL
,  "asin" char(20) NOT NULL

,  FOREIGN KEY ("production_id") REFERENCES "production" ("id")
);
CREATE INDEX idx_production_product_production_id ON production_product(production_id);
CREATE TABLE work (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  published TEXT DEFAULT NULL,
  slug TEXT DEFAULT NULL,
  type TEXT CHECK (type IN ('Book', 'Play')) DEFAULT NULL
);
CREATE INDEX idx_work_title ON work(title);
CREATE TABLE IF NOT EXISTS "work_product" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  "work_id" integer NOT NULL
,  "asin" char(20) NOT NULL

,  FOREIGN KEY ("work_id") REFERENCES "work" ("id")
);
CREATE INDEX idx_work_product_work_id ON work_product(work_id);
