FROM alpine:3.8

RUN apk add -U openssl curl tar gzip bash ca-certificates git

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub &&\
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk &&\
    apk add glibc-2.28-r0.apk &&\
    rm glibc-2.28-r0.apk

RUN curl "https://kubernetes-helm.storage.googleapis.com/helm-v2.10.0-linux-amd64.tar.gz" | tar zx &&\
    mv linux-amd64/helm /usr/bin/ &&\
    curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl" &&\
    chmod +x /usr/bin/kubectl