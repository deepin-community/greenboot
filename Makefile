PREFIX=/usr
UNIT_DIR=${PREFIX}/lib/system/system/

build:
	@echo "Build done"

install:
	mkdir -p ${DESTDIR}${PREFIX}/libexec/greenboot
	mkdir -p ${DESTDIR}${PREFIX}/lib/motd.d/
	mkdir -p ${DESTDIR}${PREFIX}/lib/systemd/system/
	mkdir -p ${DESTDIR}${PREFIX}/lib/systemd/system/greenboot-healthcheck.service.d/
	mkdir -p ${DESTDIR}${PREFIX}/lib/tmpfiles.d/
	mkdir -p ${DESTDIR}${PREFIX}/lib/greenboot/check/required.d
	mkdir -p ${DESTDIR}${PREFIX}/lib/greenboot/check/wanted.d
	mkdir -p ${DESTDIR}/etc/greenboot/
	install -m 755 usr/libexec/greenboot/* ${DESTDIR}${PREFIX}/libexec/greenboot/
	install -m 644 usr/lib/motd.d/boot-status ${DESTDIR}${PREFIX}/lib/motd.d/boot-status
	install -m 644 usr/lib/systemd/system/*.service ${DESTDIR}${PREFIX}/lib/systemd/system/
	install -m 644 usr/lib/systemd/system/*.target ${DESTDIR}${PREFIX}/lib/systemd/system/
	install -m 644 usr/lib/systemd/system/greenboot-healthcheck.service.d/*.conf ${DESTDIR}${PREFIX}/lib/systemd/system/greenboot-healthcheck.service.d/
	install -m 644 usr/lib/tmpfiles.d/* ${DESTDIR}${PREFIX}/lib/tmpfiles.d/
	install -m 755 usr/lib/greenboot/check/required.d/* ${DESTDIR}${PREFIX}/lib/greenboot/check/required.d/
	install -m 755 usr/lib/greenboot/check/wanted.d/* ${DESTDIR}${PREFIX}/lib/greenboot/check/wanted.d/
	install -m 644 etc/greenboot/greenboot.conf ${DESTDIR}/etc/greenboot/greenboot.conf

uninstall:
	rm -f ${DESTDIR}${PREFIX}/libexec/greenboot/*
	rm -f ${DESTDIR}${PREFIX}/lib/motd.d/boot-status
	rm -f ${DESTDIR}${PREFIX}/lib/systemd/system/*.service
	rm -f ${DESTDIR}${PREFIX}/lib/tmpfiles.d/*
	rm -f ${DESTDIR}${PREFIX}/lib/greenboot/check/required.d/*
	rm -f ${DESTDIR}${PREFIX}/lib/greenboot/check/wanted.d/*
	rm -f ${DESTDIR}/etc/greenboot/greenboot.conf