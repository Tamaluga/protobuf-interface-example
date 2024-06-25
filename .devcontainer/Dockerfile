# syntax=docker/dockerfile:1
FROM registry.gitlab.com/platform-template/base-toolchain-arm-bare-metal:2.0.0

# Switch to root as the base-toolchain image switched the user
USER root

# Disable any interaction while installing or upgrading the system via apt
ARG DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        # install other packages
        protobuf-compiler && \
    # clean up
    rm -rf /var/lib/apt/lists/*

# Create a non privileged user
ARG USER_NAME=vscode
# UIDs below 10,000 are a security risk on several systems
ARG USER_UID=10001
ARG USER_GID=${USER_UID}
RUN groupadd --gid ${USER_GID} ${USER_NAME} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USER_NAME}

# Prepare ssh folder for keys. They have to be mounted as a volume when starting the container
RUN mkdir -p /home/${USER_NAME}/.ssh && \
    chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.ssh

# Switch the non privileged user
USER ${USER_NAME}