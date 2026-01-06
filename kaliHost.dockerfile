FROM nickdinonno/kali-custom:latest

# Run update
RUN apt-get update

# Install extra add ons
RUN apt-get install -y exploitdb
RUN apt-get install -y hydra
RUN apt-get install -y wordlists
RUN apt-get install -y mariadb-client

# Create a client .cnf file to disable SSL for the client in order to use MySQL 5.5
RUN echo "[client]\nskip-ssl" > /etc/mysql/conf.d/client.cnf
