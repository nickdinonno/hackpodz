FROM mysql:5.5

# Enviornment vairable for password
ENV MYSQL_ROOT_PASSWORD=password

# Dissable needing ssl for connecting to server
RUN echo "[mysqld]\nssl=0" >> /etc/mysql/my.cnf

# Copy sql config file from local machine to container
COPY vulnSqlSetup.sql /docker-entrypoint-initdb.d/

EXPOSE 3306