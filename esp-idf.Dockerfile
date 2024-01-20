FROM debian:10.9-slim

RUN apt-get update -y && \
    apt-get install -y --fix-missing git curl wget \
    neovim python3 python3-dev python3-venv python3-pip minicom \
    build-essential cmake libusb-1.0.0 zsh xxd

WORKDIR /esp-idf

RUN git clone -b v5.1.2 --recursive https://github.com/espressif/esp-idf.git .

RUN ./install.sh

WORKDIR /app

COPY ./entrypoint.sh /app/

RUN chmod +x /app/entrypoint.sh

RUN chsh -s $(which zsh) && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    zsh

ENTRYPOINT [ "/app/entrypoint.sh" ]`