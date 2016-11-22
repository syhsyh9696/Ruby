# Ruby遇到的问题
---

## rvm安装RVM
>当出现
>rvm is not a function, selecting rubies with 'rvm use ...' will not work.

解决方法 终端运行
>$ source ~/.rvm/scripts/rvm
> 或者加入到.bashrc/.zshrc


## ruby daemons使用方法
>gem install daemons 注意所有的出现在守护脚本中的文件地址必须换为绝对地址

## ruby gem install mysql2可能会出现的问题
```bash
sudo apt-get install libmysqlclient-dev
gem install mysql
```
问题就可以解决了

## ruby gem install mysql2树莓派出现的问题
```bash
#debian
sudo apt-get install ruby-dev
#centos
yum install ruby-devel
```

# nvm安装后找不到命令的办法
```bash
$ nvm
```
如果有输出的话说明安装成功 否则执行
```bash
$ source ~/.nvm/nvm.sh
```
