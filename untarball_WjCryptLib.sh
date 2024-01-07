#!/bin/sh

#
# this shell working on debian/ubuntu linux.
# test platform: 
# 	debian7/10 running in intel chips
#

#set -x;

# tarball_home tarball根目录
tarball_home="$(pwd)"
# 超级用户名
root_name="root"
# 成功安装的标记
ok_tarball_mark="$tarball_home/ok_tarball_mark"



#
# 检查用户是否是超级用户$USER=="root". (在黑屏系统中有效!!)
# 在xorg 可视化系统中, 你用xfce4-terminal 切换root权限, $USER 永远等于adan.
# 即在xorg 可视化系统中, 你用什么用户登录桌面, $USER 永远等于那个用户.
#
echo "login user: $USER"
if [ "$USER" = "$root_name" ];then
	echo -e "(adan_shaw@qq.com): \nsuper authority ok, starting uninstall tarball-package."
else
	echo "login user is not root-user,"
	echo "please make sure that login user has enouhg authority to run this shell script."
	echo "root-user better!!"

	# 询问用户是否继续
	read -r -p "Are You Sure That You Wanna Go On? [Y/n] " input;
	case $input in
		[yY][eE][sS]|[yY]) echo "Yes, the program going on."; ;;
		[nN][oO]|[nN]) echo -e "bye bye\n" "bye bye\n" "bye bye\n"; exit 1; ;;
		*) echo "Invalid input!!\n" "Invalid input!!\n" "program abort.\n"; exit 1; ;;
	esac
fi





echo -e "\n\n\n"
echo "*************************************"
echo "uninstall tarball-package started !!!"
echo "*************************************"





#
# 卸载
#
FILE2="$ok_tarball_mark"
FILE3="/home/tarball/WjCryptLib"
FILE4="/usr/local/include/WjCryptLib"
FILE5="/usr/local/lib/libWjCryptLib.so"
FILE6="/usr/local/lib/libWjCryptLib.a"

if [ -f "$FILE2" ];then
	rm $FILE2
fi
if [ -d "$FILE3" ];then
	rm -r $FILE3
fi
if [ -L "$FILE4" ];then
	rm $FILE4
fi
if [ -L "$FILE5" ];then
	rm $FILE5
fi
if [ -L "$FILE6" ];then
	rm $FILE6
fi



rm -r ./build
mkdir ./build
# 执行码源重置(默认不打开!!)
#./restore_this_tarball_src.sh



echo "*************************************"
echo "uninstall tarball-package finished !!"
echo "*************************************"
