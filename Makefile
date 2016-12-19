default: generate

clean:
	rm -rf public

generate: clean
	hugo

develop:
	hugo server --watch

restore_static:
	vault2env secret/aws/private -- s3sync --loglevel=1 s3://luzifer-io-static/ static/

save_static:
	vault2env secret/aws/private -- s3sync -P -d static/ s3://luzifer-io-static/

container: clean
	docker build -t quay.io/luzifer/luzifer.io .

push: container
	docker push quay.io/luzifer/luzifer.io

docker-login:
		@docker login -e="." -u="$(DOCKER_USERNAME)" -p="$(DOCKER_PASSWORD)" quay.io

auto-hook-pre-push: save_static
ci: docker-login push
