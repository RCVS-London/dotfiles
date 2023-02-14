import json

import boto3
from botocore.exceptions import ClientError


def get_secret(secret_name) -> dict[str, str] | None:
    endpoint_url = "https://secretsmanager.eu-west-2.amazonaws.com"
    region_name = "eu-west-2"

    session = boto3.session.Session()
    client = session.client(
        service_name="secretsmanager",
        region_name=region_name,
        endpoint_url=endpoint_url,
    )

    try:
        get_secret_value_response = client.get_secret_value(SecretId=secret_name)
    except ClientError as e:
        if e.response["Error"]["Code"] == "ResourceNotFoundException":
            raise RuntimeError(
                "The requested AWS secret " + secret_name + " was not found"
            )
        elif e.response["Error"]["Code"] == "InvalidRequestException":
            raise RuntimeError("The AWS IAM request was invalid due to:", e)
        elif e.response["Error"]["Code"] == "InvalidParameterException":
            raise RuntimeError("The AWS IAM request had invalid params:", e)
        else:
            raise RuntimeError(
                "Check AWS IAM permissions. Did you set DEBUG=true in your environment "
                + "if you are using development secrets?"
            )
    else:
        secret = get_secret_value_response["SecretString"]
        return json.loads(secret)
