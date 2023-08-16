#!/usr/bin/env python3
"""A script that provides some stats about Nginx logs stored in MongoDB"""


from pymongo import MongoClient


methods = {'PUT': 0,
           'POST': 0,
           'GET': 0,
           'PATCH': 0,
           'DELETE': 0}
log_count = 0
status_check_count = 0

with MongoClient() as client:
    nginx_collection = client.logs.nginx

    for log in nginx_collection.find():
        try:
            log_count += 1
            methods[log['method']] += 1
            if log['method'] == 'GET' and log['path'] == '/status':
                status_check_count += 1
        except KeyError:
            continue

print("\
{} logs\n\
Methods:\n\
\tmethod GET: {}\n\
\tmethod POST: {}\n\
\tmethod PUT: {}\n\
\tmethod PATCH: {}\n\
\tmethod DELETE: {}\n\
{} status check".format(log_count,
                        methods['GET'],
                        methods['POST'],
                        methods['PUT'],
                        methods['PATCH'],
                        methods['DELETE'],
                        status_check_count))
