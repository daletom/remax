compile:
	python ./compile.py > ./index.html
	gzip -fk7 ./index.html > ./index.html.gz
	bro.py -f -i ./index.html -o ./index.html.br
	
build:
	docker build -t hlw-remax .

push: build
	docker tag hlw-remax:latest gcr.io/cmz-personal/hlw-remax:latest
	docker push gcr.io/cmz-personal/hlw-remax:latest

run: build
	docker run -it -p 8080:80 --rm --name hlw-remax-server hlw-remax

console: build
	docker run -it --rm --entrypoint /bin/sh --name hlw-remax-console hlw-remax

all: compile

.PHONY: all build push deploy run console compile
