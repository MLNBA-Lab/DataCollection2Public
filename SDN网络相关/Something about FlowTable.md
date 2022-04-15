# 关于flowtable的进一步阐述：
广义来讲, flow (流) 就是报文接受处理的路径, table (表) 就是这条路径上的一道道关卡。
报文在设定的路径上流动, 并与路径上的一张张表 (中的表项) 匹配来决定这个报文的走向。
流表的作用就是当做数据转发的依据，是OpenFlow对网络设备的数据转发功能的一种抽象。
在OpenFlow中，数据都是作为流进行处理的。所以流表就是针对特定流的策略表项的集合，负责数据包的查找和转发

------------


## 流表和路由表的区别？
#### 1.在传统网络中，交换机和路由器的数据转发需要依赖设备中保存的MAC地址转发表IP地址路由表，流表在它的表项中整合了网络中各个层次的网络配置信息，从而在进行数据转发时可以使用更丰富的规则。
流表中的网络配置信息包括：
- Ingress port
- Ether Source
- Ether Destination
- Ehter Type
- LAN ID
- VLAN Priority
- IP source
- IP Protocal
- IP Tos bit
- TCP/UDP Source port
- TCP/UDP Destination port

**可以看出流表跨了三层：物理层、MAC层、IP层和传输层（彭老师说的是对的）**

然鹅路由表中包括的是
- destination：目的地址，
- mask：网络掩码
- pre：标识路由加入IP路由表的优先级。
- cost：路由开销，
- interface：输出接口，
- nexthop：下一跳IP地址，`

**可以看出路由表只工作在网络层。**

#### 2.FlowTable的生成、维护和下发由外置的Controller来实现，交换机只是简单地按照流表进行转发。路由表则是管理员预先配置到路由器或者路由器自己动态调节得到的，储存在交换机中。


------------


##关于FlowTable的主动模式和被动模式。

昨天的流程图，补充的一个要点：


#### 主动模式

- Controller将FlowTable信息主动下发给OpenFlowSwitch，
- 随后OpenFlowSwitch可以直接根据FlowTable进行转发。

#### 被动模式：

（昨天我主要讲的那个例子是被动，主动的由于太简单忘了讲）
- 交换机收到数据包后，首先在本地的FlowTable上查找转发目标端口，
- 如果没有匹配，则把数据包转发给Controller，由控制层决定转发端口，并下发相应的FlowTable。



------------

今天先更到这里
