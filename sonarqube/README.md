# sonarqube in docker

## about

## algorithm in balckbox

1. start ubuntu
2. install required packages
3. download and install sonar scanner
4. download and install sonarqube
5. create a user with proper privilage
6. build a docker file
7. run the image

## 1. start ubuntu

in docker we can pull official ubuntu images.

    ```bash
        docker pull ubuntu 
    ```
pulls latest supported ubuntu by default.

## 2. install required packages

sonarqube requires jdk:17 and other required packages.

    ```bash
    apt update && apt install wget unzip zip file autoconf openjdk-17-jdk make build-essential libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev libcups2-dev libfontconfig1-dev libasound2-dev libfreetype6-dev libpng-dev libffi-devgrep sed nodejs
    ```

## 3. download and install sonar scanner

always consider the latest available versions while wgetting.

    ```bash

        TZ=Asia/Kathmandu
        ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
        mkdir /sonar
        cd /sonar
        SCANNER_VERSION=4.8.0.2856
        SCANNER_FILE=sonar-scanner-cli-${SCANNER_VERSION}.zip
        SCANNER_EXPANDED_DIR=sonar-scanner-${SCANNER_VERSION}
        wget <https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/$SCANNER_FILE>
        unzip -q ${SCANNER_FILE}
        rm ${SCANNER_FILE}
        mv ${SCANNER_EXPANDED_DIR} /usr/lib/sonar-scanner
        ln -s /usr/lib/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner
        SONAR_RUNNER_HOME=/usr/lib/sonar-scanner

    ```


sonar scanner always check for sonar.properties in a home directory of the code to be analysed.

## 4. download and install sonarqube

    ```bash

        cd /sonar
        SONARQUBE_VERSION=9.9.1.69595
        SONARQUBE_NAME=sonarqube-${SONARQUBE_VERSION}
        wget <https://binaries.sonarsource.com/Distribution/sonarqube/${SONARQUBE_NAME}.zip>
        unzip ${SONARQUBE_NAME}.zip
        rm ${SONARQUBE_NAME}.zip
        mv ${SONARQUBE_NAME} /opt/sonarqube

    ```

## 5. create a user with proper privilage

here, groupid and user id is optional.

    ```bash
        groupadd sonar
        useradd -c "Sonar System User" -d /opt/sonarqube -g sonar -s /bin/bash sonar
        chown -R sonar:sonar /opt/sonarqube
    ```

## sonarqube is installed and ready to be started. follow th steps

    ```bash

        su sonar
        /opt/sonarqube/bin/linux-x86-64/sonar.sh start
        /opt/sonarqube/bin/linux-x86-64/sonar.sh console #to check status

    ```

## 6. build a docker file

    ```
        docker build -t roshankc1234/sonarqs .
    ```

## 7. run

    ```
        docker run -it -p 80:9000 --name xyz roshankc1234/sonarqs
    ```
