#!/bin/bash

cat "$@" | while read cns unicode; do
	eval "printf 'fixme\t\u$unicode\t1\n'"
done
