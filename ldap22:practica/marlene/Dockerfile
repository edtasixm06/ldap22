# LDAP Server 2022
FROM debian:latest
LABEL author="@MarleneFlor"
LABEL subject="ldapserver2022-editat"
RUN apt-get update
# variable para hacer la instalación desatendida, sin preguntas, no interactiva
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y procps iproute2 tree nmap vim iputils-ping slapd ldap-utils
RUN mkdir /opt/docker
WORKDIR /opt/docker
COPY ./* /opt/docker/
RUN chmod +x /opt/docker/startup.sh
CMD /opt/docker/startup.sh
EXPOSE 389
