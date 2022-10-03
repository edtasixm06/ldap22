#! /bin/bash

# export DEBIAN_FRONTEND=noninteractive
# apt-get -y install slapd
mkdir /var/lib/ldap-pere

rm -rf /etc/ldap/slapd.d/*
rm -rf /var/lib/ldap/* 
rm -rf /var/lib/ldap-pere/*
slaptest -f /opt/docker/slapd.conf -F /etc/ldap/slapd.d
slapadd -F /etc/ldap/slapd.d -l /opt/docker/edt-org.ldif
slapadd -b 'dc=pere,dc=cat' -F /etc/ldap/slapd.d -l /opt/docker/pere-cat.ldif
slapcat


chown -R openldap.openldap /etc/ldap/slapd.d /var/lib/ldap /var/lib/ldap-pere
/usr/sbin/slapd -d0 


# Pendent:
# configuració client
