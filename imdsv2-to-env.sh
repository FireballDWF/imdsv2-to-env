TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` 
ROLE=$1
JSON=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/iam/security-credentials/${ROLE}`
export AWS_ACCESS_KEY_ID=$(echo ${JSON} | jq --raw-output .AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo ${JSON} | jq --raw-output .SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo ${JSON} | jq --raw-output .Token)