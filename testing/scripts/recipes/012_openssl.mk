#!/usr/bin/make

PV  = 1.0.1e-2+deb7u17
PKG = openssl-$(PV)
SRC = http://download.strongswan.org/testing/openssl-fips/$(PV)/

all: install

$(PKG):
	wget -r $(SRC) --no-directories --directory-prefix $(PKG) --accept deb --no-parent

install: $(PKG)
	cd $(PKG) && dpkg -i *.deb
