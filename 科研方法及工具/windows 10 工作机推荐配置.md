# windows 10 工作机配置

编辑器 vscode

Latex : Texlive + vscode

在线latex编辑 : overleaf

python， julia 环境管理： Anaconda



浏览器 chrome 或 firefox 或 safari 或 edge 等

chrome **SwitchyOmega 代理上网** （使用浏览器账户，同步密码，插件，以及SwitchyOmega设置）

proxifier + 代理工具解决 github 同步速度问题（也可如下述，在gitconfig中写入代理）



下载软件：free download manager

uBlock Origin 广告屏蔽



windows10 自带的安全工具以及很好了吧

虚拟机的使用，方便验证问题

词典： 欧路词典 搭配 牛津高阶英汉双解 词典文件+柯林斯 词典文件

​			每日英语听力



网页内容剪藏： 印象笔记， edge自带集锦

个人笔记： Notion

markdown 软件： Typora

科学上网： Qv2ray 





## Texlive

**官方：**

​	windows : https://www.tug.org/texlive/

​	mac: https://www.tug.org/mactex/

**镜像list**	https://ctan.org/mirrors/mirmon#cn



**清华 镜像** 

https://mirrors.tuna.tsinghua.edu.cn/help/CTAN/

安装包 https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/



与VScode 搭配

https://zhuanlan.zhihu.com/p/38178015



## VScode 

https://code.visualstudio.com/

vscode 插件 **setting-sync**可结合github gist 同步vscode 设置



## github  desktop：

C:\Users\APTX\\.gitconfig 文件  设置代理

```properties
[filter "lfs"]
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
	clean = git-lfs clean -- %f
[user]
	name = XXXXXX
	email = XXXXXXX@github.com
[http]
	proxy = socks5://127.0.0.1:1089

[https]
	proxy = socks5://127.0.0.1:1089
[git]
	proxy = socks5://127.0.0.1:1089
```



## anaconda

https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/

C:\Users\XXX\\.condarc

```yaml
ssl_verify: true
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud

```



## windows 10 下 Julia 及anaconda环境配置

http://shield-sky.github.io/2020/07/09/notes-of-julia/



### 命令行中临时代理的使用

 ```powershell
   #HTTP 代理设置：
   set http_proxy=http://127.0.0.1:1080
   
   set https_proxy=http://127.0.0.1:1080
   # SOCKS5 代理设置：
   set http_proxy=socks5://127.0.0.1:1080
   set https_proxy=socks5://127.0.0.1:1080
   
   #  如果有用户名密码
   set http_proxy_user=user
   set http_proxy_pass=pass
   
   set https_proxy_user=user
   set https_proxy_pass=pass
   
   # 不走代理的ＩＰ
   # set NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24
   
   
# Ubuntu 下命令为 export
# export http_proxy=http://127.0.0.1:1080
 ```

