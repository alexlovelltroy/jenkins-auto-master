FROM jenkins

USER root
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y sloccount cloc docker git
USER jenkins

# Base
RUN /usr/local/bin/install-plugins.sh ace-editor \
authentication-tokens \
credentials \
docker-commons \
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
