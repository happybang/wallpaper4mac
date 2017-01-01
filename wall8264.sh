#!/bin/sh
#提取壁纸图片URL


# filename="thread1.20110325.log"  
# echo `expr "$filename" : '.*\([0-9]\{8\}\).*'`  
# echo `expr "$(curl http://cn.bing.com/?mkt=zh-CN |grep hprichbg)" : ".*g_img={url: '\(.*\)',id.*"`
./etc/profile 
sleep 10;url=$(expr "$(curl http://www.8264.com/list/842/ |grep http://bbs.8264.com/picture- |head -n 1)" : ".*<a href=\"\(.*\)\" target.*")
url=$(expr "$(curl $url |grep link-orimg |head -n 1)")
url=$(expr "${url%<i>*}" : ".*a href=\"\(.*\)\" class=.*")
#提取图片名称
filename=$(expr "$url" : ".*/\(.*\)")
#本地图片地址-当前用户下缺省图片目录
localpath="$HOME/Pictures/$filename"
#下载图片至本地
curl -o $localpath  $url

#调用Finder应用切换桌面壁纸
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$localpath\""
