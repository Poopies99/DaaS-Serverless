# Serverless DaaS Cloudformation

## Deployment
To Deploy Serverless Services

At Root Directory
```bash
./deploy_service.sh <SERVICE_NAME>
```

This will deploy both Serverless Service and Layer into AWS

## Layer

After any changes in the layer directory, please do the following

At Root Directory
```bash
cd layers/<SERVICE_NAME>
./build.sh 
```

This will rebuild the libraries in the lambda layer which would likely take a long time

## Service Files

All files relating to each service will be located in the libpy directory.

`Note: All import commands found in libpy directory have ABSOLUTE importing`



