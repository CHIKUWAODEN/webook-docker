FROM ubuntu:bionic

# Install packages
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install git gcc g++ make curl wget sudo
RUN apt-get -y install ruby-build ruby-dev


WORKDIR /webook


# Install Google Chrome
# RUN wget -q https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb -O google-chrome-unstable_current_amd64.deb && \
#    apt-get -y install -f ./google-chrome-unstable_current_amd64.deb


# Install wkhtmltopdf
RUN wget -q https://builds.wkhtmltopdf.org/0.12.6-dev/wkhtmltox_0.12.6-0.20180618.3.dev.e6d6f54.bionic_amd64.deb -O wkhtmltopdf.deb && \
    apt-get -y install -f ./wkhtmltopdf.deb && \
    wkhtmltopdf --help


# add sudo user
# see: https://qiita.com/iganari/items/1d590e358a029a1776d6
RUN groupadd -g 1000 webook && \
    useradd  -g      webook -G sudo -m -s /bin/bash webook && \
    echo 'webook:webook' | chpasswd

RUN echo 'Defaults visiblepw'            >> /etc/sudoers && \
    echo 'webook ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


USER webook
WORKDIR /home/webook


# Install Webook
RUN git clone https://github.com/CHIKUWAODEN/webook.git webook && \
    cd webook && \
    sudo gem install bundler && \
    bundle install && \
    rake build && \
    sudo gem install --local ./pkg/webook-0.0.1.gem && \
    webook


# viola-savepdf
# RUN sudo apt install -y npm && \
#     sudo npm install -g viola-savepdf && \
#     npm --version && \
#     savepdf --version



# Make port 80 available to the world outside this container
EXPOSE 80


WORKDIR /
CMD "/bin/bash"