# pkgsrc on Fedora 20

Just a small experiment.

    docker build -t docker-fedora-pkgsrc .
    docker run -ti docker-fedora-pkgsrc bash
    cd /usr/pkgsrc/shells/bash
    bmake install clean

In case some port refuses to build because of existing vulnerabilities, do the wrong thing and

    echo "ALLOW_VULNERABLE_PACKAGES=yes" >> /usr/pkg/etc/mk.conf
