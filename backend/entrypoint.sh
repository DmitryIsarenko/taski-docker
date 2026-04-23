#!/bin/sh
set -e

echo "Apply migrations"
python manage.py migrate

echo "Collect static"
python manage.py collectstatic --noinput

echo "Copy static to volume"
mkdir -p /backend_static/static/
cp -r /app/collected_static/. /backend_static/static/

echo "Start server"
exec "$@"