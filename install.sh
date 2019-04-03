apt update
apt install libcurl4-openssl-dev libc6 python-pip zip -y
pip install supervisor
apt install supervisor -y

echo 'deb http://ftp.debian.org/debian/ buster main' >> /etc/apt/sources.list
apt update
apt -t buster install libc6 -y

mkdir mcbrs
cd mcbrs

wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.10.0.7.zip
unzip bedrock-server-1.10.0.7.zip

conf_path="/etc/supervisor/conf.d/msc.conf"
touch $conf_path
echo "[program:mcbrs]">>$conf_path
echo "directory="$(pwd)>>$conf_path
echo "environment=LD_LIBRARY_PATH="$(pwd)>>$conf_path
echo "command="$(pwd)"/bedrock_server">>$conf_path
echo "autostart=true">>$conf_path
echo "autorestart=true">>$conf_path
echo "stderr_logfile=/tmp/mcbrs_stderr.log">>$conf_path
echo "stdout_logfile=/tmp/mcbrs_stdout.log">>$conf_path
echo "user=root">>$conf_path

supervisorctl reload
supervisorctl status
