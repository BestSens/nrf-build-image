FROM nordicplayground/nrfconnect-sdk:v2.4-branch@sha256:9f7febaa50763f7789d3aceb51ce7351792b42d9c7a1954e50c316c4ed5b3bef
RUN apt-get -y update && \
	apt-get -y --no-install-recommends --no-install-suggests install \
		curl xxd
RUN rm -Rf /var/lib/apt/lists/*

ADD bestsens-SERVER-CA.crt /usr/share/ca-certificates/bestsens/bestsens-SERVER-CA.crt
RUN echo "bestsens/bestsens-SERVER-CA.crt" >> /etc/ca-certificates.conf
RUN update-ca-certificates