FROM fholzer/nginx-brotli

RUN apk update && apk upgrade && apk add python py-pip
RUN pip install tornado>=5.0

RUN mkdir -p /build
COPY ./ /build/
RUN cd /build && \
	python ./compile.py > /usr/share/nginx/html/index.html && \
	cp ./favicon.ico /usr/share/nginx/html/favicon.ico && \
	cp ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
