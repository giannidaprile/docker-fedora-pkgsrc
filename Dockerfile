FROM fedora:20
MAINTAINER Hannes Eichblatt

RUN yum install -y deltarpm
RUN yum groupinstall -y  "Development Tools"
RUN yum install -y curl gcc-c++
RUN curl -O http://ftp.netbsd.org/pub/pkgsrc/stable/pkgsrc.tar.gz
RUN tar xvzf pkgsrc.tar.gz -C /usr
WORKDIR /usr/pkgsrc/bootstrap
RUN ./bootstrap
RUN echo PATH=\$PATH:/usr/pkg/bin >> ~/.bashrc
RUN /usr/pkg/sbin/pkg_admin -K /var/db/pkg fetch-pkg-vulnerabilities

CMD ["/usr/bin/bash"]
