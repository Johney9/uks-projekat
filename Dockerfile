FROM python:3.5.2-alpine
 RUN    apk add --update --no-cache \
        postgresql-dev \
        build-base \
        bash \
        bash-doc \
        bash-completion

 ENV PYTHONUNBUFFERED 1
 RUN mkdir -p /usr/src/app
 WORKDIR /usr/src/app
 COPY app/. /usr/src/app
 COPY requirements/requirements.txt .
 RUN pip install -r requirements.txt
 EXPOSE 8011
 CMD ["python3", "manage.py", "runserver", "0.0.0.0:8011"]