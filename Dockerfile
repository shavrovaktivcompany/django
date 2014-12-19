# Pull base image.
FROM dockerfile/ubuntu

# Install Django.
RUN \
  apt-get update && \
  apt-get install -y python3-pip libpq-dev python3-dev && \
  pip3 install Pillow && \
  pip3 install django && \
 pip3 install django-feedreader && \
  pip3 install gunicorn && \
 #optional for django aktiv-www2015
  pip3 install django-grappelli && \
  pip3 install django-celery && \
  pip3 install django-imagekit && \
  pip3 install django_summernote && \
  pip3 install psycopg2 && \
  pip3 install python3-ldap && \
  mkdir -p /opt/django && \
  mkdir -p /opt/static && \
  mkdir -p /opt/media
#  cd /opt/django &&\
#  python3 manage.py makemigrations &&\
#  python3 manage.py  migrate &&\
#  python3 manage.py runserver 192.168.0.188:8000

# Define mountable directories.
VOLUME ["/opt/django", "/opt/static", "/opt/media"]
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

# Define working directory.
WORKDIR /opt/django

# Define default command.
#CMD ["/docker-entrypoint.sh"]

# Expose ports.
EXPOSE 8000
