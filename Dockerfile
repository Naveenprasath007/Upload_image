FROM python:3.10
WORKDIR /app
COPY ./Upload_image ./

RUN pip install --upgrade pip

COPY ./requirements.txt .

RUN pip install -r requirements.txt

RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r /app/requirements.txt --no-cache-dir

COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]