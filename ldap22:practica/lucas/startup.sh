#! /bin/bash

echo "Inicialització BD ldap edt.org"

rm -rf /etc/ldap/slapd.d/*
rm -rf /var/lib/ldap/*
slaptest -f slapd.conf -F /etc/ldap/slapd.d
slapadd -F /etc/ldap/slapd.d/ -l edt-org.ldif
chown -R openldap.openldap /etc/ldap/slapd.d /var/lib/ldap
/usr/sbin/slapd -d0
