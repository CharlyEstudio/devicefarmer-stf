FROM devicefarmer/stf:latest

USER root

RUN apt-get update && \
        apt-get install -y openjdk-8-jdk python3 wget unzip curl build-essential libssl-dev libffi-dev libxml2 libxslt1-dev zlib1g-dev libc6-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev tk-dev libbz2-dev adb && \
        curl -sL https://deb.nodesource.com/setup_20.x | sh - && \
        apt-get install -y nodejs && \
        npm install -g appium@1.22.0 --unsafe-perm=true --allow-root --chromedriver-skip-install && \
        adb start-server

# RUN groupadd -r stf && useradd -r -g stf stf

COPY . /app

# RUN chown -R stf:stf /app

# USER stf

CMD ["sh", "-c", "stf local --adb-host 127.0.0.1 --public-ip 192.168.0.102"]
