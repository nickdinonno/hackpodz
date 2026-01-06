-- Create db and user to interact with it
CREATE USER 'vulnsql'@'%' IDENTIFIED BY 'password';
CREATE DATABASE IF NOT EXISTS enterpriseCredentials;
GRANT ALL PRIVILEGES ON enterpriseCredentials.* TO 'vulnsql'@'%';
FLUSH PRIVILEGES;

-- Create table with credentials for players to steal
USE enterpriseCredentials;
CREATE TABLE LoginCredentials (username varchar(64), password varchar(64));
INSERT INTO LoginCredentials VALUES ('admin', 'h4rd2Kr4ckP@55w0rD');
INSERT INTO LoginCredentials VALUES ('angelaM', '1rLb055!2025');
INSERT INTO LoginCredentials VALUES ('johnnyT', 'cl1Nt@n#456');
INSERT INTO LoginCredentials VALUES ('flag', 'ctf{ripMySql}');