CREATE EXTENSION pg_strsearch;

CREATE TABLE pg_strsearch_rg (
	col1	VARCHAR(128),
	col2	VARCHAR(128),
	col3	VARCHAR(128)
);

INSERT INTO pg_strsearch_rg VALUES('test1', NULL, 'dummy');
INSERT INTO pg_strsearch_rg VALUES('test1', 'test2', 'dummy');
INSERT INTO pg_strsearch_rg VALUES('test1', 'test2', 'test3');

SELECT pg_strsearch('test');

DROP TABLE pg_strsearch_rg;
DROP EXTENSION pg_strsearch;
