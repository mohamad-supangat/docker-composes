CREATE USER IF NOT EXISTS root@localhost IDENTIFIED BY 'docker';
SET PASSWORD FOR root@localhost = PASSWORD('docker');
GRANT ALL ON *.* TO root@localhost WITH GRANT OPTION;
CREATE USER IF NOT EXISTS root@'%' IDENTIFIED BY 'docker';
SET PASSWORD FOR root@'%' = PASSWORD('docker');
GRANT ALL ON *.* TO root@'%' WITH GRANT OPTION;
CREATE USER IF NOT EXISTS docker@'%' IDENTIFIED BY 'docker';
SET PASSWORD FOR myuser@'%' = PASSWORD('docker');
