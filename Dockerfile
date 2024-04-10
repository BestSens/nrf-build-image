FROM nordicplayground/nrfconnect-sdk:v2.6-branch
RUN apt-get -y update && \
	apt-get -y --no-install-recommends --no-install-suggests install \
		curl \
		dos2unix \
		xxd
RUN rm -Rf /var/lib/apt/lists/* && sed -i 's/$@/"$@"/g' /root/entry.sh && dos2unix /root/entry.sh

ADD bestsens-SERVER-CA.crt /usr/share/ca-certificates/bestsens/bestsens-SERVER-CA.crt
RUN echo "bestsens/bestsens-SERVER-CA.crt" >> /etc/ca-certificates.conf
RUN update-ca-certificates