default: generate

clean:
		rm -rf public

generate: clean
		hugo

develop:
		hugo server --watch

fetch_uploads:
		s3cmd sync s3://luzifer.io/uploads/ static/uploads/

upload: generate
		s3cmd sync -P --delete-removed public/ s3://luzifer.io/

container: clean hugo/hugo
	docker build -t registry.luzifer.io/luzifer_io .

push: container
	docker push registry.luzifer.io/luzifer_io

hugo/hugo:
	wget https://gobuilder.me/get/github.com/spf13/hugo/hugo_master_linux-386.zip
	unzip hugo_master_linux-386.zip
	rm hugo_master_linux-386.zip
