# docker run -t --rm --name ansible --security-opt seccomp=unconfined --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v $HOME/.ssh:/home/user/.ssh:ro ansible-test
#
# Parts are taken from solita/docker-systemd (Thanks).

FROM debian:buster

ENV container docker

# Don't start any optional services except for the few we need.
RUN find /etc/systemd/system \
    /lib/systemd/system \
    -path '*.wants/*' \
    -not -name '*journald*' \
    -not -name '*systemd-tmpfiles*' \
    -not -name '*systemd-user-sessions*' \
    -exec rm \{} \;

RUN apt-get update && apt-get install -y systemd ssh sudo python
RUN sed -i 's/PasswordAuthentication .*/PasswordAuthentication no/g' /etc/ssh/sshd_config
RUN sed -i 's/PubkeyAuthentication .*/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
RUN adduser --gecos "" --disabled-password --uid 1000 user && adduser user sudo && echo "user:user" | chpasswd
RUN systemctl enable ssh
RUN systemctl set-default multi-user.target

STOPSIGNAL SIGRTMIN+3

# Workaround for docker/docker#27202, technique based on comments from docker/docker#9212
CMD ["/bin/bash", "-c", "exec /sbin/init --log-target=journal 3>&1"]