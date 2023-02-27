FROM python:3.11-alpine

RUN \
    apk add --no-cache uwsgi-python3 \
    && pip install poetry

COPY pyproject.toml .
RUN poetry config virtualenvs.create false \
    && poetry install --no-root --only=main

COPY wsgi_echo_server.py .
COPY docker/entrypoint.sh /usr/bin/

ENV HTTP_PORT= WSGI_PORT=
ENTRYPOINT ["entrypoint.sh"]
