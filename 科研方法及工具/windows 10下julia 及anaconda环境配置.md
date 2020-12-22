## **Julia**

根据 [Roger的提醒](https://zhuanlan.zhihu.com/p/157571582)，Julia 1.5以上 julia的默认官方镜像会把境内用户按照地理位置重定向到境内。于是我下载的1.5

1. 下载[安装包](https://zhuanlan.zhihu.com/p/158421477/ https://julialang.org/downloads/#upcoming_release_vupcoming_release_upcoming_release_date) 安装

根据 [Julia PkgServer 镜像服务及镜像站索引](http://link.zhihu.com/?target=https%3A//discourse.juliacn.com/t/topic/2969)

最好先在cmd下 设置临时代理(当然你需要有一个科学上网工具)

注意在windows下， = 两边不要有空格！！！！

```bash
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

在设置好临时代理的cmd下，设置julia 服务器

```bash
 julia
 ]
 add JuliaZH
 JuliaZH.generate_startup("BFSU")
```

在安装其他包的时候，如果还是碰到解决不了的下载问题，同样可使用临时代理解决！



### **julia 利用Pkg 很方便的创建新环境**

[https://http://julialang.github.io/Pkg.jl/stable/environments/](http://link.zhihu.com/?target=https%3A//julialang.github.io/Pkg.jl/stable/environments/)

```bash
 shell> mkdir MyProject
 
 shell> cd MyProject
 /Users/kristoffer/MyProject
 
 (v1.0) pkg> activate .
 
 (MyProject) pkg> st
 Status `Project.toml`
```

## **Anaconda**

下载安装时后，windows下配置 可以再安装的时候勾选 添加**环境变量**



如果之前安装过**anaconda**，那么直接打开anaconda的jupyter选julia kernel即可

如果没有，可以参考[https://http://github.com/JuliaLang/IJulia.jl](http://link.zhihu.com/?target=https%3A//github.com/JuliaLang/IJulia.jl) 进行安装：

```julia
 using Pkg
 Pkg.add("IJulia")
 using IJulia
 notebook()
```



### **[解决Win10 PowerShell无法激活Anaconda环境的问题](http://link.zhihu.com/?target=https%3A//www.cnblogs.com/dereen/p/ps_conda_env.html)**

### **[Conda版本大于等于4.6](http://link.zhihu.com/?target=https%3A//www.cnblogs.com/dereen/p/ps_conda_env.html%233974941405)**

解决方法如下：

- 用Win + X 组合键调出PowerShell 管理员模式；

- 输入命令

  ```powershell
  conda init powershell
  ```

  

- 关闭当前powershell窗口，重新打开一个powershell窗口输入

  ```powershell
  conda activate 环境名
  ```

  测试。

CMD 的话只需把上面三步中的powershell 改为cmd.exe 即可。



### **[jupyter 中冗余的kernel问题](https://zhuanlan.zhihu.com/p/81605893)**

使用命令

```powershell
jupyter kernelspec remove 'kernelname'
```

可以删除指定的kernel



使用命令

```powershell
jupyter kernelspec list
```

可以查看jupyter所有的kernel



## 重装julia后

目前我是在电脑 高级管理中。手动添加julia环境变量

remove 老版本的jupyter kernel， 重新在Julia中build IJulia 即可。

### **[更改Jupyter Notebook起始目录的4种方法](http://link.zhihu.com/?target=https%3A//blog.csdn.net/qq_33039859/article/details/54604533)**

【方法1】Win+R -> cmd ->cd + 更改的路径 + enter -> jupyter notebook (推荐方法) 注意：需提前jupyter-note book.exe文件所在的目录，添加至path环境变量中



## **关于vscode**

下载相应的julia插件



vscode 中使用jupyter 貌似无法交互，好像因为涉及到用WebIO，最好使用浏览器。



## **最后 几个julia材料**

[https://http://juliadocs.github.io/Julia-Cheat-Sheet/zh-cn/](http://link.zhihu.com/?target=https%3A//juliadocs.github.io/Julia-Cheat-Sheet/zh-cn/)

[An Introduction to Machine Learning in Julia](http://link.zhihu.com/?target=https%3A//juliacomputing.com/blog/2016/09/28/knn-char-recognition.html)

[如何在Julia编程中实现GPU加速](http://link.zhihu.com/?target=https%3A//www.jiqizhixin.com/articles/102903)



## **参考文献**

1. [windows下控制台代理设置](http://link.zhihu.com/?target=https%3A//www.52dzd.com/2019/07/31/windows%E4%B8%8B%E6%8E%A7%E5%88%B6%E5%8F%B0%E4%BB%A3%E7%90%86%E8%AE%BE%E7%BD%AE/)
2. [Julia PkgServer 镜像服务及镜像站索引](http://link.zhihu.com/?target=https%3A//discourse.juliacn.com/t/topic/2969)
3. [julia的包管理新手入门(After V1.4)](http://link.zhihu.com/?target=https%3A//discourse.juliacn.com/t/topic/3333)
4. [关于Jupyter Notebook的kernel](https://zhuanlan.zhihu.com/p/81605893)
5. [解决Win10 PowerShell无法激活Anaconda环境的问题](http://link.zhihu.com/?target=https%3A//www.cnblogs.com/dereen/p/ps_conda_env.html)
6. [更改Jupyter Notebook起始目录的4种方法](http://link.zhihu.com/?target=https%3A//blog.csdn.net/qq_33039859/article/details/54604533)