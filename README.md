# pg_strsearch
This extension provides cheat (but useful) functions on PostgreSQL.

pg_strsearch is released under the [PostgreSQL License](https://opensource.org/licenses/postgresql), a liberal Open Source license, similar to the BSD or MIT licenses.

## Test Status
[![Build Status](https://travis-ci.org/github/SeinoYuki/pg_strsearch.svg?branch=master)](https://travis-ci.org/github/SeinoYuki/pg_strsearch)

## Install

Download the source archive of pg_strsearch from
[here](https://github.com/SeinoYuki/pg_strsearch),
and then build and install it.

    $ cd pg_strsearch
    $ make USE_PGXS=1 PG_CONFIG=/opt/pgsql-X.Y.Z/bin/pg_config
    $ su
    # make USE_PGXS=1 PG_CONFIG=/opt/pgsql-X.Y.Z/bin/pg_config install
    # exit

USE_PGXS=1 must be always specified when building this extension.
The path to [pg_config](http://www.postgresql.org/docs/devel/static/app-pgconfig.html)
(which exists in the bin directory of PostgreSQL installation)
needs be specified in PG_CONFIG.
However, if the PATH environment variable contains the path to pg_config,
PG_CONFIG doesn't need to be specified.

## Functions

Note that **CREATE EXTENSION pg_strsearch** needs to be executed
in all the databases that you want to execute the functions that
this extension provides.

    =# CREATE EXTENSION pg_strsearch;

### SETOF record pg_strsearch()
Return some string in Table and Record ;
This function returns a record, shown in the table below.

| Table   | ColumnName | Value |
