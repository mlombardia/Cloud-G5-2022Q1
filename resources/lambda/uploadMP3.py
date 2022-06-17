import boto3
import json
import pandas as pd

def main(event, context):

    s3 = boto3.resource('s3')
    df = pd.read_json(url)
    data = df.to_json()
    fileName = 'data' + '.json '
    uploadByteStream = bytes(json.dumps(data.encode('UTF-8')))
    s3.meta.client.upload_file(uploadByteStream, 'itba-tp-podcasts-bucket2', 'comentaristas.mp3')
    resp = {
		"statusCode": 200,
		"headers": {
			"Access-Control-Allow-Origin": "*",
		},
		"body": "El lab ha sido finalizado correctamente",
	}
	

    return resp