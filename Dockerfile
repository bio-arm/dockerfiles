FROM docker.io/openeuler/openeuler:22.03-lts-sp1

RUN sed -i "s@repo.openeuler.org@repo.huaweicloud.com/openeuler@g" /etc/yum.repos.d/openEuler.repo

COPY scripts/setup-basic.sh /tmp/
RUN /tmp/setup-basic.sh

COPY scripts/setup-xvfb.sh /tmp/
RUN /tmp/setup-xvfb.sh

COPY scripts/setup-biocbuild-user.sh /tmp/
RUN /tmp/setup-biocbuild-user.sh

USER biocbuild

RUN mkdir -p $HOME/bin
RUN mkdir -p $HOME/Downloads

COPY scripts/setup-pdf-viewer.sh /tmp/
RUN /tmp/setup-pdf-viewer.sh

COPY scripts/setup-pandoc.sh /tmp/
RUN /tmp/setup-pandoc.sh

COPY scripts/setup-gsl.sh /tmp/
RUN /tmp/setup-gsl.sh

COPY ./JAGS-4.3.2.tar.gz /tmp/
COPY scripts/setup-jags.sh /tmp/
RUN /tmp/setup-jags.sh

COPY scripts/setup-gdal.sh /tmp/
RUN /tmp/setup-gdal.sh

COPY scripts/setup-udunits2.sh /tmp/
RUN /tmp/setup-udunits2.sh

COPY scripts/setup-dotnet.sh /tmp/
RUN /tmp/setup-dotnet.sh

COPY scripts/setup-openbabel.sh /tmp/
RUN /tmp/setup-openbabel.sh

COPY scripts/setup-libsbml.sh /tmp/
RUN /tmp/setup-libsbml.sh

COPY scripts/setup-BBS.sh /tmp/
RUN /tmp/setup-BBS.sh

COPY scripts/setup-R.sh /tmp/
RUN /tmp/setup-R.sh


COPY scripts/setup-profile.sh /tmp/
RUN /tmp/setup-profile.sh


RUN ["/usr/bin/bash"]
