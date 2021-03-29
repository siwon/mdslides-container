FROM python:buster

WORKDIR /usr/src/app

RUN python -m pip install git+https://gitlab.com/da_doomer/markdown-slides.git

COPY . .

CMD ["/bin/bash"]
