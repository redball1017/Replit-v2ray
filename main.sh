UUID=$(curl -s $REPLIT_DB_URL/UUID)
V2RAY_DOWNLOAD_URI=$(curl -s "https://api.github.com/repos/XTLS/Xray-core/releases/latest"  | jq .assets[14].browser_download_url  | sed s/\"//  | sed s/\"//)
echo Downloading V2ray
if [ ! -f "$V2RAY_FILE_NAME" ]; then
  wget "$V2RAY_DOWNLOAD_URI" &> /dev/null
else
  rm $V2RAY_FILE_NAME
  wget "$V2RAY_DOWNLOAD_URI" &> /dev/null
fi
echo Unzipping V2ray
if [ ! -d "v2ray" ]; then
  unzip -d v2ray $V2RAY_FILE_NAME &> /dev/null
else
  rm -rf ./v2ray
  unzip -d ./v2ray $V2RAY_FILE_NAME &> /dev/null
fi
echo Configuring V2ray
if [ "$UUID" = "" ]; then
  UUID=$(cat /proc/sys/kernel/random/uuid)
  curl $REPLIT_DB_URL -d "UUID=$UUID"
fi
wget -O ./v2ray/config.json "$V2RAY_CONFIG_FILE_URI" &> /dev/null
sed -i "s/VMESS_UUID/$UUID/" ./v2ray/config.json
sed -i "s/VMESS_SECURITY/$VMESS_SECURITY/" ./v2ray/config.json
echo "Starting V2ray Services"
clear
echo -e "UUID:$UUID"
touch ./v2ray/v2ray.log
cd ./v2ray
./$V2RAY_CORE_FILE_NAME run &> ~/Replit-v2ray/v2ray/v2ray.log