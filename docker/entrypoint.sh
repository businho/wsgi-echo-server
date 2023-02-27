#!/bin/bash
if [ ! -z "$HTTP_PORT" ]; then
    _HTTP_SOCKET="--http-socket :$HTTP_PORT"
fi
if [ ! -z "$WSGI_PORT" ]; then
    _WSGI_SOCKET="--socket :$WSGI_PORT"
fi
exec uwsgi --module echo:app $_HTTP_SOCKET $_WSGI_SOCKET
