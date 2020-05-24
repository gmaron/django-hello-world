# Pull official base image
FROM python:3.8.0-alpine

# Create the appropriate directories
ENV HOME=/home/app
ENV APP_HOME=/home/app/web
ENV PYTHONPATH=${APP_HOME}:/usr/local/lib/python3.8/site-packages
RUN mkdir -p ${APP_HOME}
WORKDIR ${APP_HOME}

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update \
    && apk add gcc python3-dev musl-dev \
    && apk add supervisor nginx mysql mariadb-dev

# Supervisord folders
RUN mkdir -p /var/log/supervisor/; \
    touch /tmp/supervisor.sock

# nginx files
RUN mkdir -p /run/nginx/; \
    touch /run/nginx/nginx.pid

# Install requirements
COPY requirements.txt ./requirements.txt

RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && pip install gunicorn


# Copy necessary configurations files
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY docker/gunicorn_start.sh ${APP_HOME}/gunicorn_start.sh
COPY docker/supervisord.conf ${APP_HOME}/supervisord.conf

# Copy project
COPY . ${APP_HOME}

RUN python manage.py collectstatic

ENTRYPOINT [ "supervisord", "-n", "-c", "/home/app/web/supervisord.conf" ]