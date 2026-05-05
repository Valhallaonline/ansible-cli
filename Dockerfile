FROM python:3.14.4-alpine3.22

LABEL author='Gareth Jones (gaz@valhallaonline.info)' maintainer="valhallaonline"

LABEL org.opencontainer.image.source="https://github.com/Valhallaonline/ansible-cli"

# GCC is needed for some python dependacies to work
RUN apk add gcc openssh-client

# Alpine forces python packages to be installed into a venv if using pip
RUN python3 -m venv /venv

# Adding the venv to path to avoid any complex method
ENV PATH="/venv/bin:$PATH"

# Install PIP dependacies
RUN pip install setuptools==82.0.1   \
                ansible-core==2.16.8 \
                ansible-lint==24.6.1 \
                hcloud==2.3.0
