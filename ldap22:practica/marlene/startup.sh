#! /bin/bash

echo "Inicialització BD ldap edt.org"
# Esborrar config predeterminada
rm -rf /var/lib/ldap/*
rm -rf /etc/ldap/slapd.d/*
# generar nou directori de config apartir de fitxer de config
slaptest -f slapd.conf -F /etc/ldap/slapd.d
# afegir dades al dir de BD
slapadd -F /etc/ldap/slapd.d/ -l edt-org.ldif
slapadd -F /etc/ldap/slapd.d/ -l personatges.ldif
# cambiar permisos per fer-los del user ldap
chown -R openldap.openldap /etc/ldap/slapd.d /var/lib/ldap
# engegar dimoni ldap en foreground
/usr/sbin/slapd -d0
# inyectar nous usuaris
# ldapadd -xv -D 'cn=Manager,dc=edt,dc=org' -w secret -f personatges.ldif
