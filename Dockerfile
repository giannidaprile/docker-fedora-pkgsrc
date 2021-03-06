FROM fedora:22
MAINTAINER Hannes Eichblatt

RUN dnf install -y deltarpm
RUN dnf groupinstall -y  "Development Tools"
RUN dnf install -y curl gcc-c++ tar
RUN curl -O http://ftp.netbsd.org/pub/pkgsrc/stable/pkgsrc.tar.gz
RUN tar xvzf pkgsrc.tar.gz -C /usr
WORKDIR /usr/pkgsrc/bootstrap
RUN ./bootstrap
RUN echo PATH=\$PATH:/usr/pkg/bin >> ~/.bashrc
RUN /usr/pkg/sbin/pkg_admin -K /var/db/pkg fetch-pkg-vulnerabilities

CMD ["/usr/bin/bash"]
