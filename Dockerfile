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
  mkdir -p /opt/media && \
  chmod +x /docker-entrypoint.sh

# Define mountable directories.

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

# Define working directory.
WORKDIR /opt/django

# Define default command.
#CMD ["/docker-entrypoint.sh"]
VOLUME ["/opt/django", "/opt/static", "/opt/media"]
# Expose ports.
EXPOSE 8000
