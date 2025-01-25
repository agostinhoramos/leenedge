FROM python:3.12.5-bullseye

ENV PIP_NO_CACHE_DIR off
ENV PIP_DISABLE_PIP_VERSION_CHECK on
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 0
ENV COLUMNS 80

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    nano \
    gettext \
    chrpath \
    libssl-dev \
    libxft-dev \
    libfreetype6 \
    libfreetype6-dev \
    libfontconfig1 \
    libfontconfig1-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /server

COPY ./src/server/entrypoint.sh /usr/src/app/entrypoint.sh
COPY ./ssl /ssl/
COPY ./src/server /server/

RUN python -m venv /venv

ENV PATH="/venv/bin:$PATH"

RUN /venv/bin/pip install pip-tools

COPY ./src/server/requirements*.txt /server/

RUN /venv/bin/pip-compile requirements/requirements.in -o requirements.txt
RUN /venv/bin/pip-compile requirements/requirements-dev.in -o requirements-dev.txt

RUN /venv/bin/pip install -r requirements.txt
RUN /venv/bin/pip install -r requirements-dev.txt

RUN chmod +x /usr/src/app/entrypoint.sh

EXPOSE 8001 8765