import boto3


def main(event, context):

    #s3 = boto3.resource('s3')
    #s3.meta.client.upload_file('../comentaristas.mp3', 'itba-tp-podcasts-bucket2', 'comentaristas.mp3')
    resp = {
		"statusCode": 200,
		"headers": {
			"Access-Control-Allow-Origin": "*",
		},
		"body": "El lab ha sido finalizado correctamente",
        "rta" : str(context),
        "rta2" : str(event)
	}

    return resp