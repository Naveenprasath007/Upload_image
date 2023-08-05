FROM python:3.8.13-slim-buster
WORKDIR /app
COPY ./Upload_image ./

RUN pip install --upgrade pip

COPY ./requirements.txt .

RUN pip install -r requirements.txt

RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r /app/requirements.txt --no-cache-dir

COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]