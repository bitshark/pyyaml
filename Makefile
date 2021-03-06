
.PHONY: default build buildext force forceext install installext test testext dist clean

PYTHON=/usr/bin/python
TEST=
PARAMETERS=

build:
	${PYTHON} setup.py --with-libyaml build ${PARAMETERS}

buildext:
	${PYTHON} setup.py --with-libyaml build ${PARAMETERS}

force:
	${PYTHON} setup.py build -f ${PARAMETERS}

forceext:
	${PYTHON} setup.py --with-libyaml build -f ${PARAMETERS}

install:
	${PYTHON} setup.py --with-libyaml install ${PARAMETERS}

installext:
	${PYTHON} setup.py --with-libyaml install ${PARAMETERS}

test: build
	${PYTHON} tests/lib/test_build.py ${TEST}

testext: buildext
	${PYTHON} tests/lib/test_build_ext.py ${TEST}

testall:
	${PYTHON} setup.py test

dist:
	${PYTHON} setup.py --with-libyaml sdist --formats=zip,gztar

windist:
	${PYTHON} setup.py --with-libyaml bdist_wininst

clean:
	${PYTHON} setup.py --with-libyaml clean -a
