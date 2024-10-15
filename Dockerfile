FROM python:3.9.18-slim-bullseye
WORKDIR /src

RUN apt-get -qq update \
    && apt-get install -qy --no-install-recommends \
    git hostapd rfkill dnsmasq build-essential \
    libssl-dev iproute2 mosquitto

RUN pip install --upgrade pipenv

COPY src ./

RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy