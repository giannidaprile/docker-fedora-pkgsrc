# pkgsrc on Fedora 20

Just a small experiment.

    docker build -t docker-fedora-pkgsrc .
    docker run -ti docker-fedora-pkgsrc bash
    cd /usr/pkg/shells/bash
    bmake install clean