#!bin/bash

# RUN chown -R sonar:sonar /opt/sonarqube

# somehow you need to change owner of temp directory everytie you run the script
# RUN chown -R sonar:sonar /opt/sonarqube/temp

# can't run in root mode, as elastic beanstack can't be run as a root
su sonar -c '/opt/sonarqube/bin/linux-x86-64/sonar.sh start'

# drops you to root shell 
# dont forget docker -it option when running
/bin/bash