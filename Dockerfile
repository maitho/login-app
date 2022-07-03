FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1
WORKDIR /app

RUN apt-get update && apt-get install -y netcat
RUN apt-get -y install default-libmysqlclient-dev gcc python-mysqldb

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY . /app

EXPOSE 80
RUN chmod +x /app/start.sh
ENTRYPOINT [ "./start.sh" ]