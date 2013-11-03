% 使用Apache Thrift来实现SOA
% 李奇平(21321206)
% 2013-12-03

# 1. Thrift简介
[Apache Thrift](http://thrift.apache.org/)是Facebook开发的用于RPC(Reomte Procudure Call)的一个库，
作为实现SOA的方式中的一种，进程之间基于定义好的Service来进行通信，它具有以下几个显著的优点：

* 跨语言的支持，可以使用一种语言实现接口，另外一种语言来调用。它支持现在绝大多数的主流语言： C++, Java, Python, PHP, Ruby, Erlang, Perl, Haskell, C#, Cocoa, JavaScript, Node.js, Smalltalk, OCaml， Delphi等等。
* 简单的使用方式。使用thrift，可以简单的定义service，用户只需要定义好thrift接口文件，然后就可以基于这个文件分别去实现和调用，
thrift会为你生成好相关的类。
* 足够的技术保障。作为Facebook开发的产品，同时得到了Cloudera， Evernote等产品的使用，完全可以信赖。

所以，可以说基于RPC来进行SOA基本上已经成为主流，同类型的产品有Google的[ProtocolBuf](https://code.google.com/p/protobuf/)。

# 2. 安装thrift

首先安装依赖包, 我的系统是Ubuntu 12.04, 其他系统请参照(http://thrift.apache.org/docs/install/)

```
sudo apt-get install libboost-dev libboost-test-dev libboost-program-options-dev\
libevent-dev automake libtool flex bison pkg-config g++ libssl-dev 
```

然后下载[Apache Thrift](http://thrift.apache.org/download/)并解压。

运行基本的三步安装

```
./configure
make
sudo make install
```

# 3. 实验过程

我使用Python来实现server，使用PHP的client来调用。

首先，新建一个目录`thrift`，然后把本文档所在的整个目录放到`thrift`下，然后在`thrift`下面新建一个文件夹`lib`

```
mkdir thrift
cp -r current_project thrift
cd thrift
mkdir lib
```

**注意， current_project是本文档所在的目录**

然后，把下载好的thrift的安装包下的`lib/py`和`lib/php`两个文件夹复制到刚才新建好的`thrift/lib`下。
确保文件夹是这样的格式:

```
thrift/
    lib/
        py/
        php/
    tutorial/
        tutorial.thrift
        php/
        py/
```

然后调用`thrift`生成代码

```
thrift --gen py tutorial.thrift
thrift --gen php tutorial.thrift
```

启动Python的Server

```
python py/server.py
```

启动Php的Client

```
php php/client.php
```
