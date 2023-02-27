FROM python:3.11-slim

RUN apt update \
    && apt install -y gcc \
    && pip install flask uwsgi \
    && rm -rf /var/lib/apt/lists/*

COPY echo.py entrypoint.sh .

ENV HTTP_PORT= WSGI_PORT=
ENTRYPOINT ["./entrypoint.sh"]
