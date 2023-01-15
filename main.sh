echo Downloading V2ray
if [ ! -f "v2ray-linux-64.zip" ]; then
  wget "$V2RAY_DOWNLOAD_URI" &> /dev/null
else
  rm v2ray-linux-64.zip
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
wget -O ./v2ray/config.json "$V2RAY_CONFIG_FILE_URI" &> /dev/null
sed -i "s/VMESS_UUID/$UUID/" ./v2ray/config.json
sed -i "s/VMESS_SECURITY/$VMESS_SECURITY/" ./v2ray/config.json
echo "Starting V2ray Services"
cd ./v2ray
./$V2RAY_CORE_FILE_NAME run