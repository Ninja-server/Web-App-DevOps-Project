FROM python:3.9-alpine

MAINTAINER Ninja

WORKDIR /app

RUN apk add --no-cache \
    unixodbc \
    unixodbc-dev

COPY . /app

RUN pip3 install -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=app.python

CMD ["flask","run","--host=0.0.0.0"]
