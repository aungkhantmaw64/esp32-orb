# ESP32-ORB

A collection of miniprojects for ESP-IDF related concepts

## Building Docker Image

```bash
docker build -f ./esp-idf.Dockerfile --progress tty -t esp-idf:5.1.2 .
```

## Running A Container

Linux

```bash
docker container run --rm -it --device <port> -v $PWD:/app --name esp-idf-ci esp-idf:5.1.2 bash
```

Windows

List the connected usb devices

```bash
usbipd list
```

Use the busID of the target device from the list and attach it to the desired distro.

```bash
usbipd attach --busid <busid> --wsl <Distro>
```

Finally, run this.

```bash
docker container run --rm -it --privileged -v ${pwd}:/app --name esp-idf-ci esp-idf:5.1.2 bash
```
