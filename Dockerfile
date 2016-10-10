FROM scratch

ADD . /src

EXPOSE 1313
WORKDIR /src
ENTRYPOINT ["/src/hugo"]
CMD ["server", "--bind=0.0.0.0", "--baseUrl=https://ahlers.me/", \
     "--appendPort=false", "--disableLiveReload=true"]
