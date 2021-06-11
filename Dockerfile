FROM    python:3.9.5-buster
EXPOSE  8080
ENV     PIPENV_VENV_IN_PROJECT=true
WORKDIR /src
RUN     apt update && \
        pip install pipenv
COPY    app.py
RUN     pipenv sync
CMD     exec pipenv run gunicorn --bind 0.0.0.0:8080 cr-app-users:app
