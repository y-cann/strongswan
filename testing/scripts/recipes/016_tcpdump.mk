#!/usr/bin/make

PKG = tcpdump
SRC = https://github.com/the-tcpdump-group/tcpdump.git

NUM_CPUS := $(shell getconf _NPROCESSORS_ONLN)

all: install

.$(PKG)-cloned:
	git clone $(SRC) $(PKG)
	mkdir $(PKG)/build
	@touch $@

.$(PKG)-configured: .$(PKG)-cloned
	cd $(PKG) && ./configure --prefix=/usr --enable-ipv6 --with-crypto
	@touch $@

.$(PKG)-built: .$(PKG)-configured
	cd $(PKG) && make -j $(NUM_CPUS)
	@touch $@

install: .$(PKG)-built
	cd $(PKG) && make install
