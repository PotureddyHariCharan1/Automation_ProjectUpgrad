#!/bin/bash
echo " checking for updates "

sudo apt update -y

echo " Done with updates "

echo " Checking for apache2 running..."
service apache2 status

#checking servers
serverstart=$(service apache2 status)

if [[ $serverstart == *"active (running)"* ]]; then
  echo "process is running"
else echo "process is not running" Restarting  Apache service
# installing  apache2 server
sudo apt-get install apache2 echo  "apache2 Successfully installed...!"
fi

NOW=$(date '+%d%m%Y-%H%M%S')
FILE=$NOW
my_name="PotureddyHari"
Log_Type="httpd-logs"
TYPE="tar"
tar -czvf $my_name-httpd-logs-$NOW.tar.gz /var/log/apache2/*.log
my_file=$(du -k "$my_name-httpd-logs-$NOW.tar.gz" | cut -f1)
SIZE=$my_file
# converiong to Tar file
#tar -czvf $my_name-httpd-logs-$NOW.tar.gz /var/log/apache2/*.log

#Copy files to /tmp/ directory/
cp $my_name-httpd-logs-$NOW.tar.gz /tmp/

#SIZE=`du -k "$
# Installing awscli
sudo apt update
sudo apt install awscli

aws s3 cp /tmp/$my_name-httpd-logs-$NOW.tar.gz s3://upgrad-potureddy

#####       Return back to automation.sh directory   ######     /home/ubuntu        #######
#cd /root/Automation_Project/
echo "Checking Cronjob Status ..."
#
#
echo " Getting data about Status..!!"
systemctl status cron

### if not exists Othe action take for $cro
#write out current crontab
#crontab -l >> /etc/cron.d/automation
#echo new cron into cron file
#echo "0 8 * * * *" >> /etc/cron.d/automation
#install new cron file
#crontab /etc/cron.d/automation
#rm /etc/cron.d/automati
#0 8 * * * [-f /root/Automation_Project/automation.sh] >> /etc/cron.d/automation
#cat < crontab -l < echo " /root/Automation_Project/automation.sh" | crontab -
cron_path=/etc/cron.d/automation
cron_job="root /root/Automation_Project/automation.sh"
#cron job to run every 10 min.
echo "0 8 * * * $cron_job" > $cron_path
echo " We Already Created a Cronjob for you every day at 8 am ....!!!!  #######  "
cd /var/www/html/
spaces='                '
mspaces='	'
lspace='  '
#DIR="/var/www/html/"
#if [ -d "$DIR" ]; then

### Take action if $DIR exists ###
if [ -f /var/www/html/inventory.html ];then
#cd /var/www/html/
   echo " As Inventory Already File exists and We Appending Data into it (inventory.html)..."
   echo  "$spaces" $Log_Type "$spaces" $NOW "$spaces$mspaces$lspace" $TYPE "$spaces$lspace" $SIZE'k' >> inventory.html
else
###  Control will jump here if $DIR does NOT exists ###
   echo "Error:       ########         I Am Creating For You Now....  "
   echo "...."
   echo "...."

  # cd /var/www/html/
   echo  "$spaces" Log_Type "$spaces$lspace" Date Created "$spaces$mspaces$lspace" Type "$spaces$mspace" SIZE > inventory.html
   echo  "$spaces" $Log_Type "$spaces" $NOW "$spaces$mspaces$lspace" $TYPE "$spaces$lspace" $SIZE'k' >> inventory.html
   echo "SUCCESS... Inventory file was Created # # # # # # # Now Storeing Data into it.. "  
 exit
fi
#cat /etc/cron.d/automation
#echo '*/1 * * * * root /etc/cron.d/automation >> /root/Automation_Project/automation.sh'
#echo '*/1 * * * *  root /root/Automation_Project/automation' |crontab
#tail -f etc/cron.d/automation
