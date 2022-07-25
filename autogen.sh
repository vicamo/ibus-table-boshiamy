#!/bin/sh
set -e
set -x

mkdir -p m4
aclocal -I m4
automake --add-missing --copy
autoconf
./configure --enable-maintainer-mode $*
