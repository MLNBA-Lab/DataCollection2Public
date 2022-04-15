# Mininet 的基本使用（一）：启动
结合floodlight控制器使用的一些基本经验
首先要知道floodlight的兼听端口号是6653，所以要想在floodlight里看到，必须要指定端口号。
## 简单启动
最简单的启动方式就是这样，但是默认端口不是6653。

        cd mininet
        sudo mn 

这个启动方式，默认有以下设备：
- 交换机s1
- 两台主机h1/h2
- 一个控制器c0

如果需要设置其他的，就需要带参数启动。

------------
## 带参数启动
#### 1.指定网络设备
#####  最常见带的参数是指定控制器参数

    sudo mn --controller=remote --ip=[controller IP] --port=[controllerlistening port]

这里ip默认值是localhost，ip就得设置成6653了
#####  指定别的：主机和交换机

	--switch：
	
switch可以有三类openflow交换机：kernel内核状态、user用户态以及ovsk是Open vSwith状态。当然kerner和ovsk的性能和吞吐量会高一些，通过运行sudo mn --switch ovsk --test iperf进行iperf的测试得知。

	--host:
	
host可以写成 h1,h2

#### 2.topo
拓扑控制也用的很多

	sudo mn --topo= single	  //星型拓扑
					linear	  //线型拓扑
					tree		//树形拓扑
					reversed	//反向拓扑
					minimal	 //最小拓扑

大部分参数设定因为太复杂（未来会继续补充关于简单启动的指令方式）
所以一般会选择用脚本启动
#### 3.用脚本启动

------------
## 用脚本启动
脚本放在myTopo/myTopo.py里下

	sudo mn --cotroller=remote,port=6653 --custom myTopo/myTopo.py --topo mytopo --mac

 –mac: 作用是让MAC地址易读
 
 
一个示例脚本如下
```python
#	myTopy.py
from mininet.topo import Topo
class MyTopo( Topo ):

    def __init__( self ):
       "Create custom topo."
       # Initialize topology
       Topo.__init__( self )
 
       h1 = self.addHost( 'h1' )
       h2 = self.addHost( 'h2' )
       h3 = self.addHost( 'h3' )
       h4 = self.addHost( 'h4' )
       h5 = self.addHost( 'h5' )
 
       sw1= self.addSwitch( 'sw1' )
       sw2= self.addSwitch( 'sw2' )
       sw3= self.addSwitch( 'sw3' )
       sw4= self.addSwitch( 'sw4' )
       sw5= self.addSwitch( 'sw5' )
       sw6= self.addSwitch( 'sw6' )

       self.addLink( sw1, sw2)
       self.addLink( sw1, sw3)
       self.addLink( sw2, sw4)
       self.addLink( sw2, h2)
       self.addLink( sw3, sw5)
       self.addLink( sw3, sw6)
       self.addLink( sw4, h1)
       self.addLink( sw5, h3)
       self.addLink( sw5, h4)
       self.addLink( sw6, h5)
	   
topos = { 'mytopo': ( lambda: MyTopo() ) }
```

------------
没了