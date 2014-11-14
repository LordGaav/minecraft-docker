#!/bin/bash

XMLLINT=""
hash "xmllint" 2>/dev/null && XMLLINT="xmllint"
if [ -z "$XMLLINT" ]; then
	echo "xmllint was not found."
	exit 1
fi

getxml() { # $1 = xml file, $2 = xpath expression
	echo "cat $2" | $XMLLINT --shell $1 | \
	sed -n 's/[^\"]*\"\([^\"]*\)\"[^\"]*/\1/gp' | \
	grep --color=never .
}
