apt update
apt upgrade -y
apt install zip python-pip libcurl4-openssl-dev libc6 -y
pip install supervisor

mkdir mcbrs
cd mcbrs

wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.10.0.7.zip
unzip bedrock-server-1.10.0.7.zip

conf_path = "/etc/supervisor/conf.d/msc.conf"
touch $conf_path
echo "[program:mcbrs]">>$conf_path
echo "directory="$(pwd)>>$conf_path
echo "command=LD_LIBRARY_PATH=. ./bedrock_server">>$conf_path
echo "autostart=true">>$conf_path
echo "autorestart=true">>$conf_path
echo "stderr_logfile=/tmp/mcbrs_stderr.log">>$conf_path
echo "stdout_logfile=/tmp/mcbrs_stdout.log">>$conf_path
echo "user=root">>$conf_path

supervisorctl reload
supervisorctl status
