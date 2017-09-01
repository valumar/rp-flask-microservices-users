FROM python:3.6.2-alpine

# set working directory
# RUN mkdir -p /usr/src/app
WORKDIR /app

# add requirements (to leverage Docker cache)
ADD ./requirements.txt /app/requirements.txt

# install requirements
RUN pip install -r requirements.txt

# add app
ADD . /app

RUN addgroup  app \
  && adduser -D -H -G app app \
  && chown -R app:app /app

VOLUME /app
USER app
# run server
CMD python manage.py runserver -h 0.0.0.0
# CMD ls -la 