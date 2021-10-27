FROM ubuntu:20.04

ARG UNAME=ashahba

RUN apt-get update && \
    apt-get install -y openssh-server sudo

RUN useradd -m -s /bin/bash ${UNAME}

RUN usermod -aG sudo ${UNAME}

RUN echo '%sudo         ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

COPY ./${UNAME}.pub /home/${UNAME}/.ssh/authorized_keys

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN chown -R ${UNAME}:${UNAME} /home/${UNAME}/.ssh
RUN chmod 600 /home/${UNAME}/.ssh/authorized_keys

ENTRYPOINT service ssh start && bash
