FROM ubuntu:18.04

RUN set -e \
    && echo "deb http://security.ubuntu.com/ubuntu xenial-security main" >> /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install -y unzip build-essential gcc wget libssl-dev libffi-dev zlib1g-dev libbz2-dev  libreadline-dev libgssapi-krb5-2 libssl1.0.0  libapt-pkg5.0 libicu* libcurl3-gnutls \
    && wget https://www.python.org/ftp/python/3.7.10/Python-3.7.10.tgz \
    && tar -xf Python-3.7.10.tgz \
    && rm -rf Python-3.7.10.tgz \
    && cd Python-3.7.10 \
    && ./configure --prefix=/usr/local/python3.7.10 \
    && make && make install \
    && apt-get clean \
    && rm -rf /usr/bin/{python,pip} \
    && ln -s /usr/local/python3.7.10/bin/python3.7 /usr/bin/python \
    && ln -s /usr/local/python3.7.10/bin/pip3 /usr/bin/pip \
    && pip install paramiko
    
CMD ["/bin/bash"]
