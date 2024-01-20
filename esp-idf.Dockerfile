FROM debian:10.9-slim

RUN apt-get update -y && apt-get install -y python3 python3-pip \
    python3-venv python3-setuptools cmake git curl wget libusb-1.0.0-dev minicom xxd

WORKDIR /esp-idf

RUN git clone -b v5.1.2 --recursive https://github.com/espressif/esp-idf.git .

RUN ./install.sh

WORKDIR /app

COPY ./entrypoint.sh /app/

ENTRYPOINT [ "/app/entrypoint.sh" ]