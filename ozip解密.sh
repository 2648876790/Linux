#!/bin/bash
echo "本工具支持解密OPPO/One Plus/Realme等以ozip为固件后缀的手机固件"
echo "本工具开源，勿用于商用"
echo "本工具中的一些文件使用其他开发者的文件，您可以参阅其开源地址"
echo "oppo_ozip_decrypt官网 https://github.com/bkerler/oppo_ozip_decrypt"
echo "系统环境(Ubuntu) https://gitee.com/tiankongsnow/linux"
echo "其他环境自行测试"
echo "请将ozip文件放在 解密 文件夹下"

echo "环境配置"
sudo apt install -y python3-pip
pip3 install pycryptodome
pip3 install docopt
apt install -y tree
apt install -y brotli
sudo apt install -y git cpio aria2 brotli android-sdk-libsparse-utils openjdk-14-jdk

if test -r oppo_ozip_decrypt/ozipdecrypt.py
  then
    if test -d 解密
      then
        if test -f 解密/*.ozip
          then
            cp oppo_ozip_decrypt/ozipdecrypt.py requirements.txt 解密
            cd 解密
            sudo pip3 install -r requirements.txt
            sudo python3 ozipdecrypt.py *.ozip
            echo "解密完成"
            exit 0
          else
            echo "未检测到所需文件，真在帮您查找"
            find / -name "*.ozip" "*ozipdecrypt.py" "requirements.txt""
        fi
    fi
  else
    git clone https://github.com/bkerler/oppo_ozip_decrypt.git
    mkdir 解密
    cp oppo_ozip_decrypt/ozipdecrypt.py 解密
    cp oppo_ozip_decrypt/requirements.txt 解密
    rm -rf oppo_ozip_decrypt
    cd 解密
    sudo pip3 install -r requirements.txt
    sudo python3 ozipdecrypt.py *.ozip
    echo "解密完成"
  fi
exit 0
