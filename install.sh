apt update
apt upgrade -y
apt install zip python-pip libcurl4-openssl-dev libc6 -y
pip install supervisor

mkdir mcs
cd mcs

wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.10.0.7.zip
unzip bedrock-server-1.10.0.7.zip

LD_LIBRARY_PATH=. ./bedrock_server
