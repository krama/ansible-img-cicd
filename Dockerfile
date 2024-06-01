FROM python:3.10-slim
ENV ANSIBLE_HOST_KEY_CHECKING=False
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    ssh \
    gcc \
    openssh-client \
    libc6-dev \
    build-essential \
    libldap2-dev \
    libsasl2-dev \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip && \
    pip install --no-cache-dir ansible bs4 requests python-ldap hvac
WORKDIR /ansible
COPY collection.py /usr/local/bin/collection.py
RUN python /usr/local/bin/collection.py

ENTRYPOINT ["ansible-playbook"]
