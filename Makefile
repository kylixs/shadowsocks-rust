PREFIX ?= /usr/local/bin
TARGET ?= debug

.PHONY: all build install uninstall clean
all: build

build:
ifeq (${TARGET}, release)
	cargo build --release
else
	cargo build
endif

install:
	install -d ${DESTDIR}${PREFIX}
	install -m 755 target/${TARGET}/sslocal ${DESTDIR}${PREFIX}/sslocal
	install -m 755 target/${TARGET}/ssserver ${DESTDIR}${PREFIX}/ssserver
	install -m 755 target/${TARGET}/ssurl ${DESTDIR}${PREFIX}/ssurl
	install -m 755 target/${TARGET}/sstunnel ${DESTDIR}${PREFIX}/sstunnel

uninstall:
	rm ${DESTDIR}${PREFIX}/sslocal
	rm ${DESTDIR}${PREFIX}/ssserver
	rm ${DESTDIR}${PREFIX}/ssurl
	rm ${DESTDIR}${PREFIX}/sstunnel

clean:
	cargo clean
