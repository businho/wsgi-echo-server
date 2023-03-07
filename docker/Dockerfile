FROM python:3.11-alpine

RUN addgroup -S wsgi-echo-server \
    && adduser -G wsgi-echo-server -S wsgi-echo-server \
    && mkdir /app \
    && chown -R wsgi-echo-server:wsgi-echo-server /app

RUN apk add --no-cache --virtual .uwsgi-build-deps gcc python3-dev build-base linux-headers \
    && apk add --no-cache --virtual .uwsgi-runtime-deps pcre-dev \
    && pip install --no-warn-script-location --no-cache --upgrade pip poetry uwsgi \
    && apk del .uwsgi-build-deps

USER wsgi-echo-server:wsgi-echo-server

WORKDIR /app

COPY pyproject.toml .
RUN poetry config virtualenvs.in-project true \
    && poetry install --no-root --only=main

COPY docker/entrypoint.sh wsgi_echo_server.py ./

ENTRYPOINT ["./entrypoint.sh"]
