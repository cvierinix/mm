#!/usr/bin/python

import boto3

s3client = boto3.client('s3')
allbuckets = s3client.list_buckets()
buckets = allbuckets['Buckets']

for item in buckets:
    bucket = item['Name']
    date = item['CreationDate']

    total = 0
    size = 0
    paginator = s3client.get_paginator('list_objects')
    operation_parameters = {'Bucket': bucket}
    page_iterator = paginator.paginate(**operation_parameters)
    for page in page_iterator:
        for item in page['Contents']:
            if item['Key'][-1:] != '/':
                total += 1
                size = size + item['Size']
    print("Bucket: %s, Created: %s, Files: %s, Size: %s" % (bucket, date, total, size))
