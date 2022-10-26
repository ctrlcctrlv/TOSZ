.MAIN: TOSZ
include env
CXX := $(shell which clang)
WA := -Wno-unused-result -Wno-all
SHELL := /bin/bash
PREFIX := /usr/local
.PHONY: checkhash fetch_tosz clean install

TOSZ: TOSZ_uncompressed
	rm -f TOSZ; \
	upx -9 -o TOSZ TOSZ_uncompressed; \
	[ -f TOSZ ] && touch -t \
		"$$(date --date=@"$$(stat -c %W TOSZ_uncompressed)" \
			+'%C%y%m%d%H%M.%S')" TOSZ TOSZ_uncompressed

TOSZ_uncompressed: TOSZ.cpp
	$(CXX) $(WA) TOSZ.cpp -Os -g -static -o TOSZ_uncompressed

.ONESHELL:
TOSZ.cpp: TOSZ.CPP
	[ ! -f TOSZ.CPP -a ! -f TOSZ.cpp ] && \
		$(MAKE) OUTFILE=TOSZ.CPP fetch_TOSZ || \
		[ ! -f TOSZ.cpp ] && mv TOSZ.CPP TOSZ.cpp || \
		true

TOSZ.CPP:
	$(MAKE) OUTFILE=$@ fetch_TOSZ

.ONESHELL:
checkhash:
	TEMPFILE=`mktemp`
	$(MAKE) OUTFILE="$$TEMPFILE" fetch_TOSZ
	sha256sum -c <<< $$'a514f91418dfbde5bc03e66f8ad9a34af359e219c0cebb1fcab42aabae826b24\t'"$$TEMPFILE"
	[ -z "$$DEBUG" ] && rm "$$TEMPFILE"

fetch_TOSZ:
	wget -O "$$OUTFILE" https://templeos.org/Downloads/Linux/TOSZ.CPP

clean:
	rm TOSZ*

install:
	install TOSZ $(PREFIX)/bin
