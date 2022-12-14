# LDAP server
## @edt ASIX M06-ASO Curs 2022-2023

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


### Ldap servers:

 * **edtasixm06/ldap22:base** Server bàsic ldap, amb base de dades edt.org.

 * **edtasixm06/ldap22:editat** Servidor edt.org amb els usuaris identificats per uid, 
   usuaris típics més usuaris user01-user10, passwd de manager xifrat i activant la base
   de dades cn=config. 

 * **edtasixm06/ldap22:config** Exemples de configuració i configuració
   dinàmica del servidor.

 * **acls**

 * **edtasixm06/ldap22:schema** Servidor LDAP amb la base de dades edt.org S'ha fet el següent:

    * *futbolistaA.schema* Derivat de inetorgPerson, structural, 
      injectat dades de dades-futbolA.ldif.

    * *futbolistaB.schema* Structural derivat de TOP.

    * *futbolistaC.schema* Auxiliary.

 * **edtasixm06/ldap22:practica**   Imatge de la pràctica de ldap schema.
    Feta per els alumnes marlene i licas.
 
 * **edtasixm06/ldap22:grups** Imatge final del servei ldap amb usuaris i grups. 
   Els usuaris són identificats pel uid per exemple uid=pere,ou=usuaris,dc=edt,dc=org.
   S'han afegit grups dins de una ou=grups que conté els grups, i s'hi han posat els usuaris
   tot validant la coherència de les dades. També s'ha repassat que els homes dels
   usuaris siguin vàlids.

   ```
   dn: ou=grups,dc=edt,dc=org
   ou: grups
   description: Container per a grups del sistema linux
   objectclass: organizationalunit
   ```

   ```
   dn: cn=professors,ou=grups,dc=edt,dc=org
   objectclass: posixGroup
   cn: professors
   gidNumber: 601
   description: Grup de professors
   memberUid: pau
   memberUid: pere
   memberUid: jordi
   ```


 * **edtasixm06/ldap22:acl** Imatge per a fer proves de modificació de les acls usant
   fitxers de modificació. S'ha incorporat la BD cn=config per a l'administració
   del servidor dinàmicament.

   Detach:
   ```
   docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisix -p 389:389 -d edtasixm06/ldap22:acl
   ```

 * **edtasixm06/ldap22:phpldapadmin** Imatge amb un servidor phpldapadmin. Connecta a al servidor ldap
   anomenat *ldap.edt.org* per accedir a les bases de dades *dc=edt,dc=org* i *cn=config*. Aquesta imatge
   està basada en fedora:27 per evitar el canvi de sintaxis de PHP 7.4.

   Detach:
   ```
   $ docker run --rm  --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d edtasixm06/ldap22:phpldapadmin 
   ```



#### Desplegament

utilitzar la imatge latest (és la grups) i es pot desplegar el phpldapadmin


```
docker build -t edtasixm06/ldap22:latest

docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d edtasixm06/ldap22:latest

docker run --rm  --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d edtasixm06/ldap22:phpldapadmin
```



 

