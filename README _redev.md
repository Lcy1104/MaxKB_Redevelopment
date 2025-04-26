首先需要安装Ollama并于官网使用指令本地安装DeepSeek R1。

其次：

若原先并没有PgSQL，Anaconda等环境，则：

在项目根目录下有三个批处理文件01初始化数据库(只执行一次).bat 02启动postgresql服务.bat 03启动后台程序.bat  ，第一次使用需要执行01初始化数据库(只执行一次).bat，执行成功后每次运行时需要启动02启动postgresql服务.bat 03启动后台程序.bat即可。

若有相关环境：

如系统原先已经有相关PgSQL数据库，并建议建议名为MaxKB的数据库且启动vector插件，并对应修改conf目录下的config.yml文件。如原先已经有conda环境，则需要在项目根目录下，于base环境下pip iinstall -r requirements.txt，进行安装相关库文件。最后再运行03启动后台程序.bat。每次都要调用03启动后台程序.bat才能启动服务。

﻿

同时保证8080端口不要被占用。
