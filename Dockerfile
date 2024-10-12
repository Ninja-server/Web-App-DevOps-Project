FROM ubuntu:20.04

MAINTAINER Ninja

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    unixodbc \
    unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*
    
RUN apt-get install -y python3 python3-pip

COPY requirements.txt  /app

RUN pip3 install -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=app.python

CMD ["flask","run","--host=0.0.0.0"]
