# Replit_V2Ray（请勿滥用）
## 请切换地区为印度后在使用，美国地区存在大量封锁repl的风险
## 原理

因为Replit放通了端口443，因此我们可以在端口443(https的标准端口)运行流协议为ws(它隐藏在http协议中)的V2ray并且成功连接到它

## 功能/优点

1. 支持vmess,vless,trojan协议（shadowsocks因我个人技术不过关整不出来，用ws流协议监听了443端口但是客户端无法连接，服务端log日志无显示）
2. 采用DoH的安全dns协议，避免有些网站不能访问（Replit的dns似乎是有意要屏蔽某些adult网站，换成公共dns就没问题了）
3. 随机生成uuid及trojan密码
4. 延迟低，速度快（我在广东这边测延迟是40多，真连接延迟是500多，速度可以跑满宽带，就是晚上有点拉跨不过速度也有个2MB/s）

## 教程

首先先Fork这个Repo

然后来到Replit主页，点击用户头像下面的Create蓝色框框

![](https://replit-v2ray-dl.redball1017.gq/tutorial-1.png)

然后在弹出的窗口中点击"Import from Github"

![](https://replit-v2ray-dl.redball1017.gq/tutorial-2.png)

然后Github URL选择你Fork的repo，Language选Bash，然后点击蓝色的"Import from Github"

![](https://replit-v2ray-dl.redball1017.gq/Tutorial-3.png)

等待它导入完毕后，点击顶部的Run

等待一下，看看Console中是否有出现UUID，如果有请记录下来。

然后，进入你的V2ray客户端，并参考以下来添加服务器

![](https://replit-v2ray-dl.redball1017.gq/tutorial-7.png)

大功告成
