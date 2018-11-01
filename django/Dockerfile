FROM python:3

ENV PYTHONUNBUFFERED 1

RUN pip install Django==2.1.3
RUN pip install mysqlclient


# create a django project:
# sudo docker run -t -v $PWD:/var/www/django django-test  django-admin.py startproject hellodjango /var/www/django
# connect to database: edit file [project/]setting.py to set connection data
# import model from database:
# connect django container to mysql container (docker network create django_mysql && docker network django_mysql [mysql container])
# docker run -t --rm --network test-sym -v $PWD:/var/www/django django-test python3 /var/www/django/manage.py inspectdb > models.py
# in models.py remove manged = False and clean file
# docker run -t --rm --network test-sym -v $PWD:/var/www/django django-test python3 /var/www/django/manage.py migrate
# run server:
# sudo docker run -p 8000:8000 --rm -d --network test-sym -v $PWD:/var/www/django django-test  python3 /var/www/django/manage.py runserver 0.0.0.0:8000
# to access admin, create password: python3 manage.py createsuperuser
# create a new APP: 
# python3 manage.py startapp site1

