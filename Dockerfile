FROM debian
RUN apt update
RUN apt install -y make
RUN apt install -y binutils
RUN apt install -y build-essential
RUN apt install -y diffutils
RUN apt install -y gcc
RUN apt install -y g++
RUN apt install -y bash
RUN apt install -y patch
RUN apt install -y gzip
RUN apt install -y bzip2
RUN apt install -y perl
RUN apt install -y tar
RUN apt install -y cpio
RUN apt install -y unzip
RUN apt install -y rsync
RUN apt install -y file
RUN apt install -y bc
RUN apt install -y findutils
RUN apt install -y wget
RUN apt install -y libssl-dev
WORKDIR /buildroot
RUN chown -R nobody /buildroot
USER nobody
RUN wget https://buildroot.org/downloads/buildroot-2024.05.2.tar.gz -O /tmp/buildroot.tar.gz
RUN tar xvf /tmp/buildroot.tar.gz --strip-components=1
RUN mkdir -p /buildroot/rootfs.overlay/bin/
RUN wget https://raw.githubusercontent.com/hardenedtomb/ht/main/ht -O /buildroot/rootfs.overlay/bin/ht
RUN chmod 755 /buildroot/rootfs.overlay/bin/ht
COPY defconfig /buildroot/defconfig
COPY linux.config /buildroot/linux.config
RUN make defconfig BR2_DEFCONFIG=defconfig
RUN make
CMD bash
