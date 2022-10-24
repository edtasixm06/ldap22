# LDAP22 PRACTICA
Crear una nova imatge docker anomenada: ldap22:practica
- Pujar-la al git
- Pujar-la al dockerhub
- Generar els README.md apropiats
- Crear un schema amb:
  * Un nou objecte STRUCTURAL
  * Un nou objecte AUXILIARY
  * Cada objecte ha de tenir almenys 3 nous atributs.
  * Heu d’utilitzar almenys els atributes de tipus boolean, foto (imatge jpeg) i binary per contenir documents pdf.
- Crear una nova ou anomenada practica.
- Crear almenys 3 entitats noves dins de ou=practica que siguin dels objectClass definits en l’schema. 
  * Assegurar-se de omplir amb dades reals la foto i el pdf.
- Eliminar del slapd.conf tots els schema que no facin falta, deixar només els imprescindibles
- Visualitzeu amb phpldapadmin les dades, observeu l’schema i verifiqueu la foto i el pdf.

### Crear imatge

```
docker build -t marleneflor/ldap22:practica .
```

### Engegar containers

```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d marleneflor/ldap22:practica
```
```
docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d marleneflor/ldap22:phpldapadmin
```

### Modificar el slapd.conf, afegim els nous esquemes i eliminem els que no interesen

```
include		/etc/ldap/schema/inetorgperson.schema
include		/etc/ldap/schema/openldap.schema
include		/etc/ldap/schema/core.schema
include		/etc/ldap/schema/nis.schema
include		/opt/docker/starwars.schema
include		/opt/docker/jedis.schema
```

### Afegir la nova ou al edt-org.ldif

```
dn: ou=practica,dc=edt,dc=org
ou: practica
description: aquí ponemos lo que se hace de práctica
objecClass: organizationalunit
```
> Es pot fer amb ldapadd, però aquest prefereixo fer-ho així

### Creem el nou objecte estructural i auxiliar

> **starwars.schema:** El nou objecte estructural és derivat de TOP i fa referéncia a personatges de star wars. Com atribut obligatori el nom i si está mort o no, els atributs no obligatoris són la foto, un pdf amb una llista de les seves afiliacions i la especie del personatge.

> **forceuser.schema:** El objecte auxiliar és derivat del estructural que hem creat i tñe com a atribut obligartori el side, com a atributs no obligatoris estan les batallas, el rango i el sable

### Posar imatge com valor d'un atribut

> Per poder afegir una imatge al ldif primer s'ha de convertir a base64 i afegir el contingut amb 2 punts dobles '::'
```
base64 -w0 < assaj.jpg > assaj.ldif
```
```
x-foto:: /9l(/P2983NDOSDFNIW7RNFSLKJC3
```
### Posar arxiu com valor d'un atribut

> Per posar un arxiu al valor d'un atribut s'ha de posar un < després dels dos punts amb el path complet al arxiu

```
x-afiliacio:<file:///opt/docker/ahsoka-afiliacio.pdf
```

### Afegir usuaris amb ldapadd

> Com el valor en el camp de foto és molt llarg he decidit afegir fer un include de cada fitxer amb les dades dels personatges.

```
slapadd -F /etc/ldap/slapd.d -l personatges.ldif
```
