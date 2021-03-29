FROM python:buster

ENV USER mdslides

RUN python -m pip install git+https://github.com/siwon/markdown-slides.git
RUN apt update && \
  apt install -y chromium && \
  apt install -y rsync && \
  apt clean
RUN adduser ${USER}
RUN mkdir -p /tmp/src/slides

ENV PDF="false"

WORKDIR /tmp

COPY ./run.sh ./run.sh

CMD ["./run.sh"]

USER ${USER}
VOLUME /tmp/src/slides
