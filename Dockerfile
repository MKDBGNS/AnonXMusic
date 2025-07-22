
FROM python:3.10-slim-bullseye


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs

COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD bash start
