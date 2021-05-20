sudo apt-get install docker-ce docker-ce-cli containerd.io
apt-get update
apt-get install docker-ce docker-ce-cli

if [ ["docker images -q alfred" != ""] ]; then
  # do something
  echo "Alfred is there"
  docker stop alfred
  docker rm alfred
fi

# run a container with the name Alfred and mount some files and directories
docker build . -t alfred:latest

docker run -d -v /c/Users/lukis/BATCAVE:/BATCAVE --name alfred alfred:latest
# # -v /var/lib/mysql:/var/lib/mysql

mysql CREATE DATABASE wayneindustries;
mysql CREATE SCHEMA;
mysql CREATE TABLE fox(ID int, name varchar(255))
mysql INSERT INTO fox VALUES(50, "BATMOBILE")