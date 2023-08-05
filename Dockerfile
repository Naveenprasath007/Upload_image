FROM python:3.8.13-slim-buster
WORKDIR /app
COPY ./Upload_image ./

RUN apt-get update && apt-get install -y curl apt-transport-https python3 python3-pip python-dev locales
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18
RUN apt-get install -y unixodbc-dev

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ffmpeg

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r /app/requirements.txt --no-cache-dir

# CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
# CMD ["gunicorn","main_app.wsgi:application","--bind", "0.0.0.0:8000"]
COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]