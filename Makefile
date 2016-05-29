default: generate

clean:
	rm -rf public

generate: clean
	hugo

develop:
	hugo server --watch

restore_static:
	s3sync s3://luzifer-io-static/ static/

save_static:
	s3sync -P -d static/ s3://luzifer-io-static/

container: clean hugo/hugo
	docker build -t quay.io/luzifer/luzifer.io .

push: container
	docker push quay.io/luzifer/luzifer.io

hugo/hugo:
	wget https://gobuilder.me/get/github.com/spf13/hugo/hugo_master_linux-386.zip
	unzip hugo_master_linux-386.zip
	rm hugo_master_linux-386.zip

docker-login:
		@docker login -e="." -u="$(DOCKER_USERNAME)" -p="$(DOCKER_PASSWORD)" quay.io
