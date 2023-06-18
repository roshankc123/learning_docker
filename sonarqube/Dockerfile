FROM ubuntu

LABEL maintainer="Roshan Kc <contact@roshan-kc.com.np>"

# BEGIN ubuntu-specific
# RUN echo 'sit back and wait for 10 minutes'
RUN apt update && apt install -y wget unzip zip file autoconf openjdk-17-jdk make build-essential libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev libcups2-dev libfontconfig1-dev libasound2-dev libfreetype6-dev libpng-dev sed nodejs
# END ubuntu-specifics



# Set timezone to CST
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# set working directory to /sonar
RUN mkdir /sonar
WORKDIR /sonar

# BEGIN downnload and install of sonar-scanner
ARG SCANNER_VERSION=4.8.0.2856
ENV SCANNER_FILE=sonar-scanner-cli-${SCANNER_VERSION}.zip
ENV SCANNER_EXPANDED_DIR=sonar-scanner-${SCANNER_VERSION}
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SCANNER_FILE} && \
	unzip -q ${SCANNER_FILE} && \
	rm ${SCANNER_FILE} && \
	mv ${SCANNER_EXPANDED_DIR} /usr/lib/sonar-scanner && \
	ln -s /usr/lib/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

ENV SONAR_RUNNER_HOME=/usr/lib/sonar-scanner

# END download and install of sonar-scanner

# BEGIN download and install of sonarqube

ARG SONARQUBE_VERSION=9.9.1.69595
ENV SONARQUBE_NAME=sonarqube-${SONARQUBE_VERSION}
RUN wget https://binaries.sonarsource.com/Distribution/sonarqube/${SONARQUBE_NAME}.zip && \
    unzip ${SONARQUBE_NAME}.zip && \
    rm ${SONARQUBE_NAME}.zip && \
    mv ${SONARQUBE_NAME} /opt/sonarqube

# END download and install of sonarqube

# BEGIN setting non-root user

ENV USER=sonar
RUN addgroup sonar
RUN useradd -c "Sonar System User" -d /opt/sonarqube -g sonar -s /bin/bash ${USER}
RUN chown -R sonar:sonar /opt/sonarqube

# END setting non-root user

EXPOSE 9000
# defaults are admin & admin
COPY --chown=sonar:sonar ./starter.sh /sonar/starter.sh
CMD [ "/bin/bash", "/sonar/starter.sh" ]



