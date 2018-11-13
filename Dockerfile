FROM alpine:3.7
MAINTAINER hanz301/atmoz

# Steps done in one RUN layer:
# - Install packages
# - Fix default group (1000 does not exist)
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
RUN apk add --no-cache bash openssh openssh-sftp-server rsyslog supervisor && \
    sed -i 's/GROUP=1000/GROUP=100/' /etc/default/useradd && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY sshd_config /etc/ssh/sshd_config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY sshd.conf /etc/rsyslog.d/sshd.conf
COPY entrypoint /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
