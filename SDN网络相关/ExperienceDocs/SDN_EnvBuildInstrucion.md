# SDN准备工作：搭建属于自己的开发环境

## （一）准备工作环境

- **安装虚拟机工作环境**：VMware Workstation
- **设置虚拟机硬件配置**：8G内存;40G硬盘;1个2核处理器（肯定是不够）
- **虚拟机安装操作系统**：Ubuntu 20.4.1

###### 我配置的虚拟机：计算机名NBIC_SDN，用户名admin，密码123321

## （二）在Ubuntu上准备开发环境

**安装git**
```shell
sudo apt-get update
sudo apt-get install git
```
** 安装jdk，python，Ant**
```shell
sudo apt-get install build-essential default-jdk ant python-dev
```
## （三）搭建完整的SDN

**1. 虚拟网络Mininet**
先从GitHub上把代码clone下来，然后检查版本
```shell
git clone git://github.com/mininet/mininet
cd mininet
git tag  # list available versions
git checkout -b 2.2.1 2.2.1  # or whatever version you wish to install
cd .
```
完成之后，使用命令行开始安装mininet
```shell
mininet/util/install.sh [options]
```
option说明：

     -a: (default) install (A)ll packages - good luck!
     -b: install controller (B)enchmark (oflops)
     -c: (C)lean up after kernel install
     -d: (D)elete some sensitive files from a VM image
     -e: install Mininet d(E)veloper dependencies
     -f: install Open(F)low
     -h: print this (H)elp message
     -i: install (I)ndigo Virtual Switch
     -k: install new (K)ernel
     -m: install Open vSwitch kernel (M)odule from source dir
     -n: install Mini(N)et dependencies + core files
     -p: install (P)OX OpenFlow Controller
     -r: remove existing Open vSwitch packages
     -s <dir>: place dependency (S)ource/build trees in <dir>
     -t: complete o(T)her Mininet VM setup tasks
     -v: install Open (V)switch
     -V <version>: install a particular version of Open (V)switch on Ubuntu
     -w: install OpenFlow (W)ireshark dissector
     -y: install R(y)u Controller
     -x: install NO(X) Classic OpenFlow controller
     -0: (default) -0[fx] installs OpenFlow 1.0 versions
     -3: -3[fx] installs OpenFlow 1.3 versions
    

在这一步中，如果出现以下问题：
```shell
E: Package 'iproute' has no installation candidate
E: Package 'cgroup-bin' has no installation candidate
```
根据提示
```shell
Package is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source
However the following packages replace it:
  iproute2:i386 iproute2
  cgroup-tools
```
可以知道，我们可以使用  cgroup-tools和iproute2代替，所以手动安装这俩。
```shell
sudo apt-get install cgroup-tools iproute2
```
完成之后使用apt-get安装mininet
```shell
sudo apt-get install mininet
```
最后测试一下
```shell
sudo mn --test pingall
```
能跑起来就是成功了

**2. 控制器程序Floodlight**

git上的太慢了，floodlight可靠版本下载地址：
`	链接：https://pan.baidu.com/s/1ZRSDfsvBvQ65yOZEzf_F2g 提取码：aklc `
一键安装
```shell
cd floodlight
ant
```
然后使用命令启动floodlight

```shell
java -jar target/floodlight.jar
```
现在floodlight已经工作在localhost:8080上了
使用浏览器输入url：http://localhost:8080/ui/index.html 
显示页面正常，就成功了。

**3. 控制器程序Ryu（二选一）**
先要安装pip(一定是python3)
```shell
sudo apt install python3-pip 
```
然后使用pip3去安装ryu
```shell
pip3 install ryu
```
安装完成后输入
```shell
ryu-manager
```
如果能成功就行了。

**4. 抓包工具Wireshark**
```shell
sudo apt-get install wireshark
```
中间会点一次确定，完成之后使用命令
```shell
sudo wireshark
```
启动。就成功了。


------------

基本就这些，没了。想起来再更。


