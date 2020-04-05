#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-
from http.server import HTTPServer, SimpleHTTPRequestHandler, HTTPStatus
import ssl
import os

dirname = os.path.dirname(__file__)

httpd = HTTPServer(('localhost', 4443), SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket (httpd.socket, server_side=True,
                                certfile=os.path.join(dirname, './localhost.pem'),
                                keyfile=os.path.join(dirname, './localhost-key.pem'))
httpd.serve_forever()

