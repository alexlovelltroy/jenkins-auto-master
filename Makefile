current_dir = $(shell pwd)

.PHONY: clean
clean:
	docker kill jenkins-auto-master
	docker rm jenkins-auto-master
	rm -Rf jenkins_home
	git checkout jenkins_home

container:
	docker build . -t jenkins-auto-master

run:
	docker run -p 8080:8080 -p 50000:50000 -v $(current_dir)/jenkins_home:/var/jenkins_home -d --name jenkins-auto-master jenkins-auto-master

update_plugins:
	./update_all_plugins.sh
