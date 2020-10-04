FROM python:3.8.6-slim-buster AS builder

RUN apt-get update && apt-get install make
RUN pip install pip==20.2.3

# Per Docker best practices: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
RUN groupadd -r oneupdate && useradd --create-home --no-log-init -r -g oneupdate oneupdate
ENV PATH="/home/oneupdate/.local/bin:${PATH}"

FROM builder AS production

USER oneupdate

COPY ./requirements/base.txt /requirements/base.txt
RUN pip install --user -r /requirements/base.txt


FROM production AS development

COPY ./requirements/development.txt /requirements/development.txt
RUN pip install --user -r /requirements/development.txt

WORKDIR /app

CMD [ "/bin/bash" ]