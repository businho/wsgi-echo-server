#!/bin/sh
exec uwsgi \
    --module "wsgi_echo_server:create_app()" \
    --virtualenv .venv \
    --uid nobody \
    --gid nobody
