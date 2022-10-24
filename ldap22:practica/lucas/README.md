# LDAP22 PRACTICA SCHEMA

## Pujar-la al git

```
a190074lr@g17:~/Documents/M06$ git add . ; git commit -m 'hoy'; git push
```

## Pujar-la al docker hub

```
a190074lr@g17:~/Documents/M06/LDAP/SCHEMA/PRACTICA$ docker push a190074lr/ldap22:schema_practica
```

## Generar els README.md apropiats

## Crear un schema amb:

> ### Un nou objecte STRUCTURAL

> ```
> objectClass (1.1.2.1.1 NAME 'x-oficis'
>  DESC 'Oficis dels treballadors.'
>  SUP TOP
>  STRUCTURAL
>  MUST ( x-nom $ x-ofici )
>  MAY ( x-foto $ x-cv $ x-anys-treballant $ x-inversor-cripto )
> )
> ```

> ### Un nou objecte AUXILIARY

> ``` 
> objectClass ( 1.1.2.2.2 NAME 'x-futur-millonari'
>  DESC 'Possibilitat de ser futur millonari.'
>  SUP TOP
>  AUXILIARY
>  MUST x-nom
>  MAY ( x-inversor-cripto )
>  )
> ```

> ## Cada objecte ha de tenir almenys 3 nous atributs.

> __ATRIBUTS 1R OBJECTE (STRUCTURAL)*__

>> *Defineix el nom complert del treballador.*

>> ```
>> attributetype (1.1.2.1.1 NAME 'x-nom'
>>  DESC 'Nom del treballador.'
>>  EQUALITY caseIgnoreMatch
>>  SUBSTR caseIgnoreSubstringsMatch
>>  SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 -> string
>>  SINGLE-VALUE
>> )
>> ```

>> *Oberservar la foto del __dni__ del treballador.*

>> ```
>> attributetype (1.1.2.1.2 NAME 'x-foto'
>>  DESC 'Foto del treballador.'
>>  SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 -> foto (.jpeg)
>> )
>> ```

>> *Oberservar el cv del treballador.*

>> ```
>> attributetype (1.1.2.1.3 NAME 'x-cv'
>>  DESC 'CV del treballador.'
>>  SYNTAX 1.3.6.1.4.1.1466.115.121.1.28 -> binary (.pdf)
>> )
>> ```

>> *Defineix l'ofici del treballador.*

>> ```
>> attributetype (1.1.2.1.4 NAME 'x-ofici'
>>  DESC 'Nom del treballador.'
>>  EQUALITY caseIgnoreMatch
>>  SUBSTR caseIgnoreSubstringsMatch
>>  SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 -> string
>>  SINGLE-VALUE
>> )
>> ```

>> *Defineix els any treballant del treballador.*

>> ```
>> attributetype (1.1.2.1.5 NAME 'x-anys-treballant'
>>  DESC 'Nom del treballador.'
>>  EQUALITY integerMatch
>>  SUBSTR integerOrderingMatch
>>  SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 -> integer
>>  SINGLE-VALUE
>> )
>> ```

> __ATRIBUTS 2N OBJECTE (AUXILIARY)__

>> *Defineix el nom del futur millonari.*

>> ```
>> attributetype (1.1.2.2.1 NAME 'x-nom-futur-millonari'
>>  DESC 'Nom del futur millonari.'
>>  EQUALITY caseIgnoreMatch
>>  SUBSTR caseIgnoreSubstringsMatch
>>  SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 -> string
>>  SINGLE-VALUE
>> )
>> ```

>> *Defineix el patrimoni total del futur millonari.*

>> ```
>> attributetype (1.1.2.2.2 NAME 'x-patrimoni'
>>  DESC 'Patrimoni del futur millonari.'
>>  EQUALITY caseIgnoreMatch
>>  SUBSTR caseIgnoreSubstringsMatch
>>  SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 -> string
>>  SINGLE-VALUE
>> )
>> ```

>> *Defineix si ha invertir en criptomonedas el futur millonari.*

>> ```
>> attributetype (1.1.2.2.3 NAME 'x-inversor-cripto'
>>  DESC 'Inversor en criptomonedas true/false.'
>>  EQUALITY caseIgnoreMatch
>>  SUBSTR caseIgnoreSubstringsMatch
>>  SYNTAX 1.3.6.1.4.1.1466.115.121.1.7 -> boolean
>>  SINGLE-VALUE
>> )
>> ```

## Crear una nova ou anomenada practica

Editant el fitxer __edt-org.ldif__.

```
dn: ou=practica,dc=edt,dc=org
ou: practica
description: Container per oficis practica
objectClass: organizationalUnit
```

## Crear almenys 3 entitats noves dins de ou=practica que siguin dels objectClass definits en l’schema.

Editant el fitxer __edt-org.ldif__.

*Introduïm la primera entitat.*

```
dn: cn=Marc Porto Salvatierra,ou=practica,dc=edt,dc=org
objectClass: x-oficis
objectClass: x-futur-millonari
x-nom: Marc Porto Salvatierra
x-foto:<file:/opt/docker/foto_marc.jpeg
x-cv:<file:/opt/docker/cv_marc.pdf
x-ofici: Propietari d'un bar que alhora és una ASO.
x-anys-treballant: 3
x-inversor-cripto: FALSE
```

*Introduïm la segona entitat.*

```
dn: cn=Jenner Sarmiento Mendoza,ou=practica,dc=edt,dc=org
objectClass: x-oficis
x-nom: Jenner Sarmiento Mendoza
x-foto:<file:/opt/docker/foto_jenner.jpeg
x-cv:<file:/opt/docker/documents/cv_jenner.pdf
x-ofici: Militar, en concret pertany a l'infanteria de marina.
```

*Introduïm la tercera entitat.*

```
dn: cn=Bruno Rodríguez Aranibar,ou=practica,dc=edt,dc=org
objectClass: x-oficis
x-nom: Bruno Rodríguez Aranibar
x-foto:<file:/opt/docker/foto_bruno.jpeg
x-cv:<file:/opt/docker/documents/cv_bruno.pdf
x-ofici: Pertany a una banda de motoristes, viu la vida sense diners.
x-anys-treballant: 0
```

*Introduïm una quarta entitat.*

```
dn: cn=Lucas Rodríguez Cabañeros,ou=practica,dc=edt,dc=org
objectClass: x-oficis
objectClass: x-futur-millonari
ou: practica
x-nom: Lucas Rodríguez Cabañeros
x-foto:<file:/opt/docker/images/foto_lucas.jpeg
x-cv:<file:/opt/docker/documents/cv_lucas.pdf
x-ofici: Youtuber, Streamer, TikToker, actor.
x-inversor-cripto: TRUE
```

> ### Assegurar-se de omplir amb dades reals la foto i el pdf.

> *Adjutem la ruta absoluta d'on extreura les fotos i pdf's, dins dels atributs creats especifícament per emmagatzemar aquest tipus d'entrada.*

> ```
> x-dni:<file:/opt/docker/images/dni_lucas.jpeg
> x-cv:<file:/opt/docker/documents/cv_lucas.pdf
> ```

## Eliminar del slapd.conf tots els schema que no facin falta, deixar només els imprescindibles

Esborrar del fitxer *slapd.conf*

```
include		/etc/ldap/schema/core.schema
include		/etc/ldap/schema/cosine.schema
include		/etc/ldap/schema/inetorgperson.schema
include		/etc/ldap/schema/misc.schema
include		/etc/ldap/schema/nis.schema
include		/etc/ldap/schema/openldap.schema
include		/opt/docker/practica.schema
```

## Encendre el container

> ### Container BD LDAP

> *Construir l'imatge.*

> ```
> $ docker build -t a190074lr/ldap22:schema_practica .
> ```

> *Encendre el container.*

> ```
> $ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d a190074lr/ldap22:schema_practica
> ```

> ### Container PHPLDAPADMIN

> *Encendre el container.*

> ```
>$ docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d a190074lr/ldap22:phpldapadmin
> ```

## Visualitzeu amb phpldapadmin les dades, observeu l’schema i verifiqueu la foto i el pdf.