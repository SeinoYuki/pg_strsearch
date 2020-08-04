/* contrib/pg_strsearch/pg_strsearch--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_strsearch" to load this file. \quit

/* ***********************************************
 * Administrative functions for PostgreSQL
 * *********************************************** */

/* generic file access functions */

DROP TABLE IF EXISTS public.pg_strsearch ;

CREATE TABLE public.pg_strsearch (
	TableName	VARCHAR(128),
	ColumnName	VARCHAR(128),
	ColumnValue	VARCHAR(128)
);

CREATE OR REPLACE FUNCTION pg_strsearch(names VARCHAR(128)) RETURNS TABLE(col1 VARCHAR(128), col2 VARCHAR(128),col3 VARCHAR(128)) AS $$

DECLARE rec			RECORD;
DECLARE	ColumnName	VARCHAR(128);
DECLARE Sql			VARCHAR(128);

DECLARE allSearch CURSOR 
FOR
	SELECT		A.relname,
				B.column_name,
				B.data_type
	FROM		pg_stat_user_tables AS A
				INNER JOIN information_schema.columns AS B
					ON A.relname = B.table_name
	WHERE		B.data_type IN ('character varying') AND A.relname <> 'pg_strsearch'
	ORDER BY	A.relname,
				B.column_name;
BEGIN
OPEN allSearch;

LOOP 
	FETCH allSearch INTO rec;
	IF NOT found THEN
      exit;
    END IF;
	Sql := 'SELECT ' ||  '''' || rec.relname ||  '''' || ', ' || '''' || rec.column_name || '''' || ', ' || rec.column_name
		|| ' FROM ' || rec.relname 
		|| ' WHERE ' || rec.column_name  || ' LIKE ''%' || names || '%''';
	EXECUTE 'INSERT INTO pg_strsearch ' || Sql;
END LOOP;
RETURN QUERY SELECT * FROM pg_strsearch;

CLOSE allSearch;
END;
$$ LANGUAGE plpgsql;
