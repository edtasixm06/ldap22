# ldapserver 2022

FROM debian:latest
LABEL author="@edt ASIX Curs 2022"
LABEL subject="ldapserver 2022"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y procps iproute2 iputils-ping nmap tree slapd ldap-utils
RUN mkdir /opt/docker/
WORKDIR /opt/docker/
COPY * /opt/docker/
RUN chmod +x /opt/docker/startup.sh
CMD /opt/docker/startup.sh
EXPOSE 389
