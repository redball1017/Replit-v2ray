echo Downloading V2ray
if [ ! -f "v2ray-linux-64.zip" ]; then
  wget "$V2RAY_DOWNLOAD_URI" &> /dev/null
else
  rm v2ray-linux-64.zip
  wget "$V2RAY_DOWNLOAD_URI" &> /dev/null
fi
echo Unzipping V2ray
if [ ! -d "v2ray" ]; then
  unzip -d v2ray v2ray-linux-64.zip &> /dev/null
else
  rm -rf ./v2ray
  unzip -d ./v2ray v2ray-linux-64.zip &> /dev/null
fi
echo Configuring V2ray
wget -O ./v2ray/config.json "$V2RAY_CONFIG_FILE_URI" &> /dev/null
sed -i "s/VMESS_UUID/$UUID/" ./v2ray/config.json
echo "Starting V2ray Services"
cd ./v2ray
./v2ray run