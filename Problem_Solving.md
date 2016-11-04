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

## ruby gem install mysql可能会出现的问题
```bash
sudo apt-get install libmysqlclient-dev
gem install mysql
```
问题就可以解决了
