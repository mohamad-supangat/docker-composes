docker run --volume ./reset.sql:/docker-entrypoint-initdb.d --volume ./mysql-data:/var/lib/mysql mariadb --init-file=/docker-entrypoint-initdb.d/reset.sql
