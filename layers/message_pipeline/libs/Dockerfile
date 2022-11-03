FROM lambci/lambda:build-python3.8

WORKDIR /var/task
COPY requirements.txt ./
RUN pip install -t python/lib/python3.8/site-packages -r requirements.txt