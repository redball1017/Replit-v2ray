echo 正在部署环境
TPWD=$(curl -s $REPLIT_DB_URL/TPWD)
UUID=$(curl -s $REPLIT_DB_URL/UUID)
FILE_DOWNLOAD_URI=$(curl -s "https://api.github.com/repos/XTLS/Xray-core/releases/latest"  | jq .assets[14].browser_download_url  | sed s/\"//  | sed s/\"//)
filename_list=(${FILE_DOWNLOAD_URI//\// })
FILE_NAME=${filename_list[7]}
echo $NAME
echo 正在下载
if [ ! -f "$FILE_NAME" ]; then
  wget "$FILE_DOWNLOAD_URI" &> /dev/null
else
  rm $V2RAY_FILE_NAME
  wget "$FILE_DOWNLOAD_URI" &> /dev/null
fi
echo 正在解压
if [ ! -d "CORE" ]; then
  unzip -d CORE $FILE_NAME &> /dev/null
else
  rm -rf ./CORE
  unzip -d ./CORE $FILE_NAME &> /dev/null
fi
echo 正在配置
if [ "$UUID" = "" ]; then
  UUID=$(cat /proc/sys/kernel/random/uuid)
  curl $REPLIT_DB_URL -d "UUID=$UUID"
fi
if [ "$TPWD" = "" ]; then
  TPWD=$(pwgen -s 15 1)
  curl $REPLIT_DB_URL -d "TPWD=$TPWD"
fi
wget -O ./CORE/config.json "$CONFIG_FILE_URI" &> /dev/null
sed -i "s/VMESS_UUID/$UUID/" ./CORE/config.json
sed -i "s/TROJAN_PWD/$TPWD/" ./CORE/config.json
sed -i "s/VMESS_SECURITY/$VMESS_SECURITY/" ./CORE/config.json
echo "正在启动V2ray"
clear
echo -e "VMESS信息:\n端口(port):443\n额外ID(alterId):0\n用户ID(id):$UUID\n加密方式(security):$VMESS_SECURITY\n传输协议(network):ws\nWS路径(wspath):/vmess\nTLS:tls\nVLESS信息:\n端口(port):443\n用户ID(id):$UUID\n传输协议(network):ws\nWS路径(wspath):/vless\nTLS:tls\nTrojan信息:\n端口(port):443\n密码(password):$TPWD\n传输协议(network):ws\nWS路径(wspath):/vless\nTLS:tls"
touch ./CORE/log.log
cd ./CORE
./$CORE_FILE_NAME run &> ./CORE/log.log