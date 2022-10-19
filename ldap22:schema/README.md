# LDAP server
## @edt ASIX M06-ASO Curs 2022-2023

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


### Ldap servers:

 * **edtasixm06/ldap22:schema** imatge ldap per implementar
   un schema propi de futbolistes.


```
$ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d edtasixm06/ldap22:schema

$ docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d edtasixm06/ldap22:phpldapadmin
```

```
$ ldapadd -xv -D 'cn=Manager,dc=edt,dc=org' -w secret -f data-futbolB.ldif 

```



 







