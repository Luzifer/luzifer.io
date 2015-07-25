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
