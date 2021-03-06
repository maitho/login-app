#!/bin/sh

while ! nc -z mysql 3306 ; do
    echo "Waiting for the MySQL Server"
    sleep 3
done

python manage.py migrate
python manage.py createsuperuser --no-input
python manage.py runserver 0.0.0.0:80