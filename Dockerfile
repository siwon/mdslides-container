FROM python:buster

ENV USER mdslides

RUN apt update && \
  apt install -y rsync && \
  apt clean

COPY ./markdown-slides /tmp/markdown-slides

RUN python -m pip install /tmp/markdown-slides
RUN adduser ${USER}
RUN mkdir -p /tmp/src/slides

ENV PDF="false"

WORKDIR /tmp

COPY ./run.sh ./run.sh

CMD ["./run.sh"]

# USER ${USER}
VOLUME /tmp/src/slides
