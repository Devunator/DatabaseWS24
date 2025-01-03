CREATE TABLE companies (
    cid INTEGER PRIMARY KEY,
    companyname CHARACTER VARYING(255),
    country CHARACTER VARYING(255)
);

CREATE TABLE directors (
    did INTEGER PRIMARY KEY,
    directorname CHARACTER VARYING(255)
);

CREATE TABLE stars (
    sid INTEGER PRIMARY KEY,
    starname CHARACTER VARYING(255)
);

CREATE TABLE writers (
    wid INTEGER PRIMARY KEY,
    writername CHARACTER VARYING(255)
);

CREATE TABLE movies (
    mid INTEGER PRIMARY KEY,
    moviename CHARACTER VARYING(255),
    rating CHARACTER VARYING(10),
    genre CHARACTER VARYING(100),
    releaseyear INTEGER,
    releasedate CHARACTER VARYING(255),
    imdbscore DOUBLE PRECISION,
    imdbvotes DOUBLE PRECISION,
    did INTEGER REFERENCES directors(did),
    wid INTEGER REFERENCES writers(wid),
    lid INTEGER REFERENCES leadingactor(lid),
    budget DOUBLE PRECISION,
    gross DOUBLE PRECISION,
	cid INTEGER REFERENCES companies(cid),
    runtime DOUBLE PRECISION
);