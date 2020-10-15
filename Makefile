export AWS_REGION=eu-west-1

default: generate

clean:
	rm -rf public

generate: clean
	hugo

develop:
	hugo server --watch --disableFastRender

restore_static:
	vault2env --key=secret/aws/private -- s3sync --loglevel=1 s3://luzifer-io-static/ static/

save_static:
	vault2env --key=secret/aws/private -- s3sync -P -d static/ s3://luzifer-io-static/

container: clean
	docker build -t quay.io/luzifer/luzifer.io .

push: container
	docker push quay.io/luzifer/luzifer.io

update_gpg:
	gpg --export 43A4CD1C19DAE8558D40088E0066F03ED215AD7D >static/.well-known/openpgpkey/hu/4m4uuzs67okqg1u914zd6mag9p8predd
	$(MAKE) save_static

auto-hook-pre-push: save_static 
ci: push
