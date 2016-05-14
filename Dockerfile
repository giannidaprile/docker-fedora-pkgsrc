FROM centos:6
MAINTAINER Gianni D'Aprile

RUN yum install -y deltarpm
RUN yum groupinstall -y  "Development Tools"
RUN yum install -y curl gcc-c++ tar ncurses-devel
RUN curl -O http://ftp.netbsd.org/pub/pkgsrc/stable/pkgsrc.tar.gz
RUN tar xvzf pkgsrc.tar.gz -C /usr
WORKDIR /usr/pkgsrc/bootstrap
RUN ./bootstrap
RUN echo PATH=\$PATH:/usr/pkg/bin >> ~/.bashrc
ENV PATH $PATH:/usr/pkg/bin
ENV ALLOW_VULNERABLE_PACKAGES yes
RUN /usr/pkg/sbin/pkg_admin -K /var/db/pkg fetch-pkg-vulnerabilities
WORKDIR /usr/pkgsrc/pkgtools/pkg_rolling-replace
RUN bmake install cleandir
WORKDIR /usr/pkgsrc/pkgtools/pkgin
RUN bmake install cleandir
WORKDIR /usr/pkgsrc/pkgtools/pkgclean
RUN bmake install cleandir
RUN pkgclean
WORKDIR /root
CMD ["/bin/bash"]
