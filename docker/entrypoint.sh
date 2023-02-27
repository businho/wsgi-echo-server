#!/bin/sh
if [ -z "$HTTP_PORT" ] && [ -z "$WSGI_PORT" ]; then
    echo "ERROR: Set HTTP_PORT or WSGI_PORT."
    exit 1
fi

if [ ! -z "$HTTP_PORT" ]; then
    _HTTP_SOCKET="--http-socket :$HTTP_PORT"
fi
if [ ! -z "$WSGI_PORT" ]; then
    _WSGI_SOCKET="--socket :$WSGI_PORT"
fi
exec uwsgi \
    --module "wsgi_echo_server:create_app()" \
    --virtualenv .venv \
    --uid nobody \
    --gid nobody \
    $_HTTP_SOCKET \
    $_WSGI_SOCKET
