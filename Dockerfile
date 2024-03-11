FROM nordicplayground/nrfconnect-sdk:v2.5-branch@sha256:3eb5e982087093c5579fd1c6c31ce5f379b6450d15ffcb87792bf483515f274c
RUN apt-get -y update && \
	apt-get -y --no-install-recommends --no-install-suggests install \
		curl
RUN rm -Rf /var/lib/apt/lists/*

ADD bestsens-SERVER-CA.crt /usr/share/ca-certificates/bestsens/bestsens-SERVER-CA.crt
RUN echo "bestsens/bestsens-SERVER-CA.crt" >> /etc/ca-certificates.conf
RUN update-ca-certificates