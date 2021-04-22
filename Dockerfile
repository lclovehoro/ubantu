FROM boystar/ubantu:latest

RUN set -e \
    && apt-get update && apt-get upgrade \
    && apt-get install -y build-essential gcc build \
    && wget https://www.python.org/ftp/python/3.7.10/Python-3.7.10.tgz \
    && tar -xf Python-3.7.10.tgz \
    && rm -rf Python-3.7.10.tgz \
    && cd Python-3.7.10 \
    && ./configure --prefix=/usr/local/python3.7.10 \
    && make && make install \
    && apt-get clean \
    && export $PATH:$HOME/bin:/usr/local/python3.7.10/bin \
    && rm -rf /usr/bin/{python,pip} \
    && ln -s /usr/local/python3.7.10/bin/python3.7 /usr/local/python \
    && ln -s /usr/local/python3.7.10/bin/pip3 /usr/local/pip
    
CMD ["/bin/bash"]
