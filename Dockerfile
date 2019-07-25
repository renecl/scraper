FROM alpine:3.10

RUN apk update && \
  apk add --no-cache \
    bash \
    gcc \
    linux-headers \
    musl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    openssl-dev \
    python3-dev \
    python3

#RUN apk add --no-cache bash
RUN pip3 install --upgrade pip
RUN pip3 install Scrapy

WORKDIR /src

COPY requirements.txt /
COPY my_script.py /src
RUN pip install -r /requirements.txt




# overwrite this with 'CMD []' in a dependent Dockerfile
CMD /bin/sh
#CMD [ "python", "/src/my_script.py" ]