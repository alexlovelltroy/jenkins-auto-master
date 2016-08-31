#!/bin/bash
JENKINS_URL=localhost:8080

curl -sLO http://$JENKINS_URL/jnlpJars/jenkins-cli.jar

UPDATE_LIST=$( java -jar jenkins-cli.jar -s http://$JENKINS_URL/ list-plugins | grep -e ')$' | awk '{ print $1 }' );
if [ ! -z "${UPDATE_LIST}" ]; then
    echo Updating Jenkins Plugins: ${UPDATE_LIST};
    java -jar jenkins-cli.jar -s http://$JENKINS_URL/ install-plugin ${UPDATE_LIST};
    java -jar jenkins-cli.jar -s http://$JENKINS_URL/ safe-restart;
else
	echo "No Jenkins Plugins to update"
fi
