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
	docker build -t registry.luzifer.io/luzifer_io .

push: container
	docker push registry.luzifer.io/luzifer_io

hugo/hugo:
	wget https://gobuilder.me/get/github.com/spf13/hugo/hugo_master_linux-386.zip
	unzip hugo_master_linux-386.zip
	rm hugo_master_linux-386.zip
