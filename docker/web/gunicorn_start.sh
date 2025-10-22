#!/bin/bash
cd /app
# Apply migrations
python manage.py migrate
# Start Gunicorn
gunicorn app.wsgi:application --bind 0.0.0.0:8000
