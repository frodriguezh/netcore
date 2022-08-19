FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

#Instalacion java jdk, openssh, zip, unzip, jfrog cli, aws cli
RUN apt update && \
	apt -y install default-jdk && \
	apt -y install openssh-client && \
	apt -y install zip && \
	apt -y install unzip && \
	curl -fL https://install-cli.jfrog.io | sh && \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install

#Instalacion sonar-scanner cli

WORKDIR /usr/src

ARG SCANNER_VERSION=4.7.0.2747
ENV SCANNER_FILE=sonar-scanner-cli-${SCANNER_VERSION}-linux.zip
ENV SCANNER_EXPANDED_DIR=sonar-scanner-${SCANNER_VERSION}-linux
RUN curl --insecure -o ${SCANNER_FILE} \
    -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SCANNER_FILE} && \
	unzip -q ${SCANNER_FILE} && \
	rm ${SCANNER_FILE} && \
	mv ${SCANNER_EXPANDED_DIR} /usr/lib/sonar-scanner && \
	ln -s /usr/lib/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

ENV SONAR_RUNNER_HOME=/usr/lib/sonar-scanner

COPY sonar-runner.properties /usr/lib/sonar-scanner/conf/sonar-scanner.properties

RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /usr/lib/sonar-scanner/bin/sonar-scanner

CMD ["sonar-scanner", "-Dsonar.projectBaseDir=/usr/src"]

WORKDIR /source
