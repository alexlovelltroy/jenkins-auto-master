FROM jenkins:2.7.2

USER root
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y sloccount cloc wget git docker
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
VOLUME /var/lib/docker
USER jenkins

# Base
RUN /usr/local/bin/install-plugins.sh ace-editor \
authentication-tokens \
credentials \
durable-task \
git \
git-client \
icon-shim \
javadoc \
mailer \
matrix-project \
maven-plugin \
plain-credentials \
scm-api \
script-security \
ssh-credentials \
ssh-slaves \
structs \
token-macro \
workflow-aggregator \
workflow-cps \
workflow-scm-step \
workflow-step-api \
workflow-support

# User Specific
RUN /usr/local/bin/install-plugins.sh docker \
docker-build-step \
docker-commons \
docker-workflow \
github \
github-api \
postbuildscript

# Make sure we exec to pass on signals correctly
CMD wrapdocker && exec java -jar /usr/share/jenkins/jenkins.war
