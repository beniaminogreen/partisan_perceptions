FROM rocker/verse

RUN apt-get install -y --no-install-recommends texlive-latex-extra \
	&& install2.r --error --deps TRUE \
    stargazer ggsignif

WORKDIR /opt/report
COPY . /opt/report

CMD make
