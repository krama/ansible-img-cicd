FROM python:3.10-alpine3.20

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apk update && \
    apk add --no-cache \
        ca-certificates \
        git \
        openssh \
        openssh-client \
        rsync \
        rsyslog \
        sshpass \
        zip \
        mariadb-dev \
        openldap-dev \
        cyrus-sasl-dev \
        gcc \
        libc-dev && \
    pip install --upgrade pip && \
    pip install --no-cache-dir \
        ansible \
        beautifulsoup4 \
        requests \
        ldap3 \
        hvac \
        mysqlclient

WORKDIR /ansible

COPY requirements.yml /ansible/requirements.yml

RUN ansible-galaxy collection install -r requirements.yml

CMD ["ansible-playbook", "--version"]
