#!/bin/bash

export C_FORCE_ROOT="true"
  cd /opt/django
  python3 manage.py makemigrations
  python3 manage.py  migrate
  python3 manage.py celeryd -l INFO -B -q &
gunicorn aktivTeam2015.wsgi --bind 0.0.0.0:8000
