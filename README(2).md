[TOC]

# easy config of newly downloaded termux

## files in directorys and their functions:

1. nvimConfig: include init.vim and plug.nvim, what you should do is just move "init.nvim" in to "~/.config/nvim"(create it by yourself) and move "plug.vim" into "/data/data/com.termux/files/usr/share/nvim/runtime/autoload", then open your nvim and use command:":PlugInstall"{It takes time. If some plugins are not downloaded at the first time, you can try it over and over again}

2. termuxConfig: include bash.bashrc which is the config file of termux terminal. you can get into "usr/etc/" and replace the original "bash.bashrc" with this one


## downloads:

1. repo update: (make your downloading much nore faster)
  1.1. change pip repo:
    run follow commands in your terminal
    # 清华源

>>>pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

    # 阿里源

>>>pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/

    # 腾讯源

>>>pip config set global.index-url http://mirrors.cloud.tencent.com/pypi/simple

    # 豆瓣源
    
>>>pip config set global.index-url http://pypi.douban.com/simple/

    # 换回默认源

>>>pip config unset global.index-url


  1.2. change termux repo:
    run follow commands:

>>>sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
>>>apt update && apt upgrade

2. recommend downloads:
  run this command to install packages below:
>>>pkg install nvim rust lua51 wget python fish lf fzf ranger glow nodejs make bat -y


3. !!!zsh!!!:(read the pdf in "termuxconfig" for more informations)
  3.1. Installation
  zsh can make your terminal much more beautiful and user-friendly. To downloaded this tool run commands below: 

sh -c $(curl -fsSL https://ghproxy.com/https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)" 

  and you can choose 14 and then 6 when you meet selections.
  3.2. Configuration
  What you need to do is just remove the old version "zshrc" and move the file named "zshrc" in "temuxConfig" into "usr/etc/"
  ! Additionally, if you want to change "font" or "color" or "theme", please use command below:
  |    demandings     |     commands     |
  |-------------------|------------------|
  |   change font     |      chfont      |
  |   change color    |      chcolor     |
  |   change theme    | edit in '~/zshrc'| {recommend -> jonathan}
  |-------------------|------------------|



## important files(or dirs) and their positions:
  1. nvim 
  1.1 Config file: init.vim
$ ~/.config/init.vim
  1.2. autoload folder:
$ usr/share/nvim/runtime/autoload
  1.3. plugin folder(where we put whole repo):
$ ~/.local/share/nvim/plugged

  2. zsh 
  2.1. config file: zshrc
  (1) $ ~/zshrc 
  this file is created to config the theme, font and color
  (2) $ usr/etc/zshrc
  this file is created to config initialzation options like cnofig of fzf and so on. (you should copy zshrc in termuxConfig to this path)

  (3) $ usr/etc/bash.bashrc
  original bashrc.
  

## add font by zsh:
  what you should do is just move the ".tff" file to dir "termux-ohmyzsh/.termux/fonts/?"(please replace the * with subdir, you can choose it randomly) 


## ranger:
  1. add icons to ranger:
>>> git clone https://ghproxy.com/https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
>>> echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
