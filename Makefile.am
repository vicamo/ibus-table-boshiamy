# vim:set ts=4
#
# ibus-table-boshiamy - The Boshiamy database of Table engine for IBus
#
# Copyright (c) 2008-2008 Yu Yuwei <acevery@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

SUBDIRS = .

ACLOCAL_AMFLAGS = -I m4

EXTRA_DIST = \
	autogen.sh \
	$(NULL)
#	@PACKAGE_NAME@.spec.in \
#	$(NULL)

noinst_DIST = \
	$(NULL)

CLEANFILES = \
	$(NULL)

MAINTAINERCLEANFILES = \
	$(GITIGNORE_MAINTAINERCLEANFILES_TOPLEVEL) \
	$(GITIGNORE_MAINTAINERCLEANFILES_M4_LIBTOOL) \
	$(GITIGNORE_MAINTAINERCLEANFILES_MAKEFILE_IN) \
	$(srcdir)/INSTALL \
	$(NULL)

DISTCHECK_CONFIGURE_FLAGS = \
	--disable-maintainer-mode \
	$(NULL)

GITIGNOREFILES = \
	$(DIST_ARCHIVES) \
	AUTHORS \
	ChangeLog \
	$(NULL)

#DISTCLEANFILES = \
#	po/stamp-it \
#	$(NULL)

##########
# icons/

icons_DATA = \
	icons/boshiamy.png \
	$(NULL)

iconsdir = $(datadir)/ibus-table/icons

EXTRA_DIST += \
	icons/boshiamy.png \
	$(NULL)

##########
# tables/

tables_DATA = \
	tables/boshiamy.db \
	$(NULL)

tablesdir = $(datadir)/ibus-table/tables

tables/boshiamy.txt: tables/boshiamy.txt.in tables/mapping.txt.in
	cp tables/boshiamy.txt.in "$@"
	echo "BEGIN_TABLE" >> "$@"
	grep -v ^fixme tables/mapping.txt.in >> "$@"
	echo "END_TABLE" >> "$@"

EXTRA_DIST += \
	tables/boshiamy.txt.in \
	tables/mapping.txt.in \
	$(NULL)

CLEANFILES += \
	$(tables_DATA) \
	tables/boshiamy.txt
	$(NULL)

.txt.db:
	@$(MKDIR_P) "$(@D)"
	$(IBUS_TABLE_CREATEDB) -n $@ -s $<

############
# RPM builds

rpm: dist @PACKAGE_NAME@.spec
	rpmbuild -bb \
			--define "_sourcedir `pwd`" \
			--define "_builddir `pwd`" \
			--define "_specdir `pwd`" \
			--define "_rpmdir `pwd`" \
			--define "_srcrpmdir `pwd`" \
			@PACKAGE_NAME@.spec

srpm: dist @PACKAGE_NAME@.spec
	rpmbuild -bs \
			--define "_sourcedir `pwd`" \
			--define "_builddir `pwd`" \
			--define "_srcrpmdir `pwd`" \
			--define "_rpmdir `pwd`" \
			--define "_specdir `pwd`" \
			@PACKAGE_NAME@.spec

clean-rpm:
	$(RM) -r "`uname -i`"

clean-local: clean-rpm

###########
# ChangeLog

distclean-local:
	if test "$(srcdir)" = "."; then :; else \
	  rm -f AUTHORS ChangeLog; \
	fi

.PHONY: ChangeLog
ChangeLog:
	$(AM_V_GEN) if test -d "$(srcdir)/.git"; then \
	  (GIT_DIR=$(top_srcdir)/.git $(top_builddir)/missing git log --stat) | fmt --split-only > $@.tmp \
	  && mv -f $@.tmp $@ \
	  || ($(RM) $@.tmp; \
	      echo Failed to generate ChangeLog, your ChangeLog may be outdated >&2; \
	      (test -f $@ || echo git-log is required to generate this file >> $@)); \
	else \
	  test -f $@ || \
	  (echo A git checkout and git-log is required to generate ChangeLog >&2 && \
	  echo A git checkout and git-log is required to generate this file >> $@); \
	fi

###########
# AUTHORS

.PHONY: AUTHORS
AUTHORS:
	$(AM_V_GEN) if test -d $(srcdir)/.git; then \
	  out="`GIT_DIR=$(top_srcdir)/.git git log --pretty=format:'%aN <%aE>' | sort -u`" \
	  && perl -p -e "s/#authorslist#// and print '$$out'" < $(srcdir)/$@.in > $@.tmp \
	  && mv -f $@.tmp $@ \
	  || ($(RM) $@.tmp; \
	      echo Failed to generate AUTHORS, your AUTHORS may be outdated >&2; \
	      (test -f $@ || echo git-log is required to generate this file >> $@)); \
	else \
	  test -f $@ || \
	  (echo A git checkout and git-log is required to generate AUTHORS >&2 && \
	  echo A git checkout and git-log is required to generate this file >> $@); \
	fi

-include $(top_srcdir)/git.mk
