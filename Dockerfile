FROM centos:8
RUN dnf -y install \
    dnf-plugins-core \
    epel-release \
    && dnf -y localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm \
    && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8 \
    && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-el-8 \
    && dnf config-manager --set-enabled powertools \
    && dnf -y install \
    git \
    ffmpeg \
    flac \
    ghostscript \
    GraphicsMagick \
    nodejs

RUN useradd spacedeck

USER spacedeck
RUN cd /home/spacedeck \
    && git clone https://github.com/spacedeck/spacedeck-open.git \
    && cd spacedeck-open \
    && npm install

WORKDIR /home/spacedeck/spacedeck-open
EXPOSE 9666
CMD ["node", "/home/spacedeck/spacedeck-open/spacedeck.js"]
