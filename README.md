# Replit_V2Ray

## 原理

因为Replit放通了端口443，因此我们可以在端口443(https的标准端口)运行流协议为ws(它隐藏在http协议中)的V2ray并且成功连接到它

## 教程

首先先Fork这个Repo

然后来到Replit主页，点击用户头像下面的Create蓝色框框

![](https://gcore.jsdelivr.net/gh/redball1017/Replit-v2ray@md-files/tutorial-1.png)

然后在弹出的窗口中点击"Import from Github"

![](https://gcore.jsdelivr.net/gh/redball1017/Replit-v2ray@md-files/tutorial-2.png)

然后Github URL选择你Fork的repo，Language选Bash，然后点击蓝色的"Import from Github"

![](https://gcore.jsdelivr.net/gh/redball1017/Replit-v2ray@md-files/Tutorial-3.png)

等待它导入完毕后，点击Tools栏下面的Secrets项

![](https://gcore.jsdelivr.net/gh/redball1017/Replit-v2ray@md-files/tutorial-4.png)

然后在右边修改UUID的值（即点击UUID旁边的笔）UUID请在[这里生成](https://www.uuidgenerator.net/)，然后点击Save

![](https://gcore.jsdelivr.net/gh/redball1017/Replit-v2ray@md-files/tutorial-5.png)

然后，点击顶部的Run

等待一下，看看Console栏里面是否有"V2Ray x.x.x started"，如果有，继续下一步，否则请看看哪里设置错了。

然后，进入你的V2ray客户端，并参考以下来添加服务器

![](https://gcore.jsdelivr.net/gh/redball1017/Replit-v2ray@md-files/tutorial-7.png)

大功告成

## 环境变量配置

在创建repl之前可以在Repo里的.env那里改；创建repl之后请到repl的Tools栏下面的Secrets项修改，修改完后记得停止再启动repl

| 变量                  | 默认值                                                       | 说明                                                         |
| --------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| V2RAY_DOWNLOAD_URI    | https://github.com/XTLS/Xray-core/releases/download/v1.7.2/Xray-linux-64.zip | V2ray/XRay资源压缩包的下载地址，文件后缀一定要是zip          |
| V2RAY_CONFIG_FILE_URI | https://github.com/redball1017/HerokuV2ray/raw/main/etc/xray.json | V2ray/Xray配置文件下载地址，可自定义，但端口一定要为443，流协议一定要为ws否则无法连接 |
| UUID                  |                                                              | 这个是vmess,vless的用户id，Trojan的密码                      |
| VMESS_SECURITY        | none                                                         | vmess加密方式，可以为aes128-gcm,chacha20-poly1305,auto,none,zero |
| V2RAY_FILE_NAME       | Xray-linux-64.zip                                            | V2ray压缩包文件名，一定要和V2RAY_DOWNLOAD_URI下载的文件一致，否则会出错。 |
| V2RAY_CORE_FILE_NAME  | xray                                                         | V2ray可执行文件名，可以为v2ray,xray                          |
