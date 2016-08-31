
## Create the jenkins container
```
docker build . -t jenkins-master
```

## Run the docker container

The docker container will reuse the config.xml from the jenkins_home directory in this repo which has authentication disabled.  ``<useSecurity>false</useSecurity> ``

```
docker run -p 8080:8080 -p 50000:50000 -v $PWD/jenkins_home:/var/jenkins_home -d --name jenkins-master jenkins-master
```
