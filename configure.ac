# vim:set ts=4
#
# ibus-table-boshiamy - The Boshiamy for IBus Tables.
#
# Copyright (c) 2009 You-Sheng Yang <vicamo@gmail.com>
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

# if not 1, append datestamp to the version number.
m4_define([package_name], [ibus-table-boshiamy])
m4_define([itb_major_version], [1])
m4_define([itb_minor_version], [6])
m4_define([itb_micro_version], [0])

m4_define([itb_version],
    itb_major_version.itb_minor_version.itb_micro_version)

AC_INIT([package_name], [itb_version], [http://github.com/vicamo/ibus-table-boshiamy/issues], [package_name])
AM_INIT_AUTOMAKE([1.10])
AM_MAINTAINER_MODE

# AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

# check for ibus-table-createdb
PKG_CHECK_MODULES([IBUS_TABLE], [ibus-table >= 1.1.0])
AC_ARG_VAR([IBUS_TABLE_CREATEDB],[[ibus-table-createdb, which generate db]])

AC_PATH_PROG([IBUS_TABLE_CREATEDB],[ibus-table-createdb],
        [AC_MSG_ERROR([ibus-table-createdb not found.])])
AS_IF([$IBUS_TABLE_CREATEDB --help >/dev/null 2>&1],[],
        [AC_MSG_ERROR([Failed to execute $IBUS_TABLE_CREATEDB.])])

# OUTPUT files
AC_CONFIG_FILES(Makefile
ibus-table-boshiamy.spec
)

AC_OUTPUT

AC_MSG_RESULT([
Build options:
  Version                   $VERSION
  Install prefix            $prefix
])

