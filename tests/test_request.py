def test_request(client, mock_hostname):
    response = client.get("/").json
    assert response == {
        "environment": {
            "HTTP_HOST": "localhost",
            "HTTP_USER_AGENT": "werkzeug/2.2.3",
            "PATH_INFO": "/",
            "QUERY_STRING": "",
            "RAW_URI": "/",
            "REMOTE_ADDR": "127.0.0.1",
            "REQUEST_METHOD": "GET",
            "REQUEST_URI": "/",
            "SCRIPT_NAME": "",
            "SERVER_NAME": "localhost",
            "SERVER_PORT": "80",
            "SERVER_PROTOCOL": "HTTP/1.1",
        },
        "host": {
            "hostname": "mockedhostname",
        },
        "http": {
            "method": "GET",
        },
        "request": {
            "body": "",
            "cookies": {},
            "headers": {
                "host": "localhost",
                "user-agent": "werkzeug/2.2.3",
            },
            "query": {},
        },
    }
