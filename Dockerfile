FROM    python:3.9.5-buster
ENV     PORT 8080
ENV     PIPENV_VENV_IN_PROJECT True
ENV     PYTHONUNBUFFERED True
WORKDIR /src
COPY    app.py Pipfile Pipfile.lock ./
RUN     apt update && \
        apt install -y gunicorn3 && \
        pip install pipenv && \
        pipenv sync
CMD     exec pipenv run gunicorn --bind 0.0.0.0:8080 app:app
