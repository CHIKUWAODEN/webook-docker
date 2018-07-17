FROM ubuntu:bionic

# Install packages
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install \
        git gcc g++ make curl wget \
        ruby ruby-dev rake bundler


WORKDIR /webook


# Install wkhtmltopdf
RUN wget -q https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb -O wkhtmltopdf.deb && \
    ls . && \
    apt-get -y install -f ./wkhtmltopdf.deb && \
    wkhtmltopdf --help

# Install Webook
RUN git clone https://github.com/CHIKUWAODEN/webook.git webook && \
    gem install rspec kramdown systemu webrick etc thor && \
    cd webook && \
    rake build && \
    gem install --local ./pkg/webook-0.0.1.gem && \
    webook


# Make port 80 available to the world outside this container
EXPOSE 80


WORKDIR /
CMD "/bin/bash"