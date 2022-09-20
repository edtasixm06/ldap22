# LDAP server
## @edt ASIX M06-ASO Curs 2022-2023

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


### Ldap servers:

 * **edtasixm06/ldap22:base** Server bàsic ldap, amb base de dades edt.org.


#### Desplegament
```
docker build -t edtasixm06/ldap22:base
```
```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisix -p 389:389 -d edtasixm06/ldap21:base

docker ps
```
```
nmap <ip-container ldap>
ldapsearch -x -LLL -b 'dc=edt,dc=org'
ldapsearch -x -LLL -h <ip-container> -b 'dc=edt,dc=org'
docker exec -it ldap.edt.org ps ax
```

