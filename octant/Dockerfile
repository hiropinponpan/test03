FROM alpine

ENV DOWNLOAD_URL https://github.com/vmware-tanzu/octant/releases/download/v0.25.1/octant_0.25.1_Linux-64bit.tar.gz

RUN apk add --update curl tar && \
    curl -L $DOWNLOAD_URL | tar xz && apk del curl tar && \
    mv ./octant_0.25.1_Linux-64bit/octant /usr/sbin && \
    rm -rf ./octant_0.25.1_Linux-64bit

COPY kubectl /usr/sbin
RUN chmod +x /usr/sbin/kubectl

COPY launch.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/launch.sh

ENTRYPOINT ["launch.sh"]