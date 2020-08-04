# contrib/pg_strsearch/Makefile

MODULE_big = pg_strsearch
EXTENSION = pg_strsearch
DATA = pg_strsearch--1.0.sql

REGRESS = pg_strsearch 

#ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
#else
#subdir = contrib/pg_strsearch
#top_builddir = ../..
#include $(top_builddir)/src/Makefile.global
#include $(top_srcdir)/contrib/contrib-global.mk
#endif