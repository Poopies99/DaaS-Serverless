#!/bin/bash

set -euo pipefail

chmod +x deploy_service.sh

help() {
cat << EOF

Usage:
$ $0 <SERVICE NAME>

Example Usage:
$ $0 message_pipeline

EOF
exit 0;
}


if [ $# -ne 1 ]; then
  help
  exit 1
fi


cd $(dirname $0)
echo $(dirname $0)

AWS_REGION=${AWS_REGION:-ap-southeast-1}
SERVICE=$1
AUTO_DEPLOY=false


if [ ! -d "services/$SERVICE" ] && [ ! -d "layers/$SERVICE" ]
then
  echo "$1 is not a valid directory"
  help
  exit 1

elif [ ! -d "services/$SERVICE/.serverless" ] && [ ! -d "services/$SERVICE/.serverless" ]
then
  echo "$1 is not a serverless directory"
  help
  exit 1

else
  echo "Deploying '$1' to Cloudformation using the following identity and config"
  aws sts get-caller-identity | tee
  echo ""

  if [[ $AUTO_DEPLOY == false ]]
  then
    read -r -p "Press Enter to proceed, Clt+C to cancel"
  fi

  set -x
  cd "layers/$SERVICE"
  sls deploy --region $AWS_REGION

  cd ..
  cd ..

  cd "services/$SERVICE"
  sls deploy --region $AWS_REGION
  set +x

fi

