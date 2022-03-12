
#!/bin/bash
echo " checking for updates "

sudo apt update -y

echo " Done with updates "

# installing  apache2 server
#sudo apt-get install apache2 # apache2 Successfully installed...!


echo " Checking for apache2 running..."
service apache2 status

#checking servers
 
serverstart=$(service apache2 status)

if [[ $serverstart == *"active (running)"* ]]; then
  echo "process is running"
else echo "process is not running" Restarting  Apache service
fi

#checking if apache restarted or not
# Restarting  Apache service

#sudo service apache2 restart

#Creating Tar file
#myname=$(PotureddyHari)
NOW=$(date '+%d%m%Y-%H%M%S')
FILE=$NOW
tar -czvf PotureddyHari-httpd-logs-$NOW.tar.gz /var/log/apache2/*.log

#Copy files to /tmp/ directory
#cd /var/log/apache2/
cp PotureddyHari-httpd-logs-$NOW.tar.gz /tmp/

#checking un-compreseed storage data 
#cat PotureddyHari-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar

# Installing awscli 
sudo apt update
sudo apt install awscli

#running tar file
#aws s3\
#cp /tmp/PotureddyHari-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar \
#s3://upgrad-potureddy/


#Un-Compressing tar file
#echo " please wait we are uncompressing file for you to......"
#".........."
#".........."
#".........."
#".........."
#du -sh PotureddyHari-httpd-logs-$NOW.tar.gz
#Size of tar file  Before compression

#unzip -v PotureddyHari-httpd-logs-$NOW.tar.gz
#Size of tar file  after compression
#du -sh PotureddyHari-httpd-logs-$NOW.tar
# Copying to the S3 bucket

aws s3 cp /tmp/PotureddyHari-httpd-logs-$NOW.tar.gz s3://upgrad-potureddy

#AWS CONFIGURE LIST
aws configure list

#####       Return back to automation.sh directory   ######     /home/ubuntu        #######
cd /home/ubuntu
ls

