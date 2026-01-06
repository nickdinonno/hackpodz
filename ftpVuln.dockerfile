FROM ubuntu:20.04

# Download and install outdated vsftpd
RUN apt-get update && apt-get install -y wget build-essential libssl-dev git
RUN git clone https://github.com/DoctorKisow/vsftpd-2.3.4.git /opt/vsftpd-2.3.4

# Build the binary
WORKDIR /opt/vsftpd-2.3.4
RUN make

# Copy binary to path
RUN cp /opt/vsftpd-2.3.4/vsftpd /usr/local/sbin/

# Create required directories and change anon log in directory to one we just made
RUN mkdir -p /usr/share/empty /home/ftp && chown root:root /home/ftp && chmod 555 /home/ftp
RUN usermod -d /home/ftp nobody

# Challenge setup
RUN echo "Welcome to my super secure FTP server! The flag is here but I bet you can't find it!" > /home/ftp/README.txt

# Create user to host flag
RUN useradd -m administrator && echo "administrator:!Cr@zYp4S5w0Rd!" | chpasswd

# Plant flag 
RUN echo "ctf{whoKnewItWasThatEasy:)}" > /home/administrator/flag.txt && chown administrator:administrator /home/administrator/flag.txt && chmod 600 /home/administrator/flag.txt

# Copy vsftpd config file from local machine to docker
COPY vsftpd.conf /etc/

# Open ports 21 for ftp and 6200 for backdoor
EXPOSE 21
EXPOSE 6200

# Change working directory to where flag is for when they backdoor in
WORKDIR /home/administrator

# Run vuln vsftpd server on startup
CMD ["/usr/local/sbin/vsftpd", "/etc/vsftpd.conf"]