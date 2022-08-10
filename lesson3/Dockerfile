# use ubuntu as the base package
FROM ubuntu:22.04
# update it
RUN apt-get update
# install curl
RUN apt-get -y install curl
# download bitcoin archive
RUN curl -OL https://bitcoin.org/bin/bitcoin-core-22.0/bitcoin-22.0-x86_64-linux-gnu.tar.gz

ARG bitcoin_hash
RUN echo "$bitcoin_hash bitcoin-22.0-x86_64-linux-gnu.tar.gz" | sha256sum --check

# untar it
RUN tar zxvf bitcoin-22.0-x86_64-linux-gnu.tar.gz
# test via cli
RUN ln -s /bitcoin-22.0/bin/bitcoin-cli /bitcoin-cli

EXPOSE 18444/tcp

EXPOSE 18443/tcp

ENTRYPOINT ["/bitcoin-22.0/bin/bitcoind"]