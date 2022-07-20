import {DynamoDBClient, GetItemCommand} from "@aws-sdk/client-dynamodb";

const getPodcastByTitleFromDynamoDB = async (title: string) => {
    const dynamodb = new DynamoDBClient({region: "us-east-1"});

    const params = {
        TableName: "podcasts",
        Key: {
            Title: {N: title}
        },
        ProjectionExpression: 'ATTRIBUTE_NAME',
    };

    const result = await dynamodb.send(new GetItemCommand(params));

    return result.Item;
}

exports.handler = (request: any) => {
    const title = request.queryStringParameters.title;

    if (!title) {
        return {
            statusCode: 400,
            body: JSON.stringify({
                error: 'queryparam title is required'
            })
        };
    }

    const podcast = getPodcastByTitleFromDynamoDB(title);

    if (!podcast) {
        return {
            statusCode: 404,
            body: JSON.stringify({
                error: `podcast not found with title: ${title}`
            })
        };
    }

    return {
        statusCode: 200,
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            podcast,
        }),
    };
}
