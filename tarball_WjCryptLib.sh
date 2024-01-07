#!/bin/sh

#
# this shell working on debian/ubuntu linux.
# test platform: 
# 	debian7/10 running in intel chips
#

#set -x


#
# 全局变量
#
# 超级用户名
root_name="root"
# 安装本tarball包的用户名
install_user="tarball"

# ffmpeg 安装路径
install_path="/home/tarball/WjCryptLib"
# tarball_home tarball根目录
tarball_home="$(pwd)"

# 成功安装的标记
ok_tarball_mark="$tarball_home/ok_tarball_mark"



#
# 检查用户是否是超级用户$USER=="root". (在黑屏系统中有效!!)
# 在xorg 可视化系统中, 你用xfce4-terminal 切换root权限, $USER 永远等于adan.
# 即在xorg 可视化系统中, 你用什么用户登录桌面, $USER 永远等于那个用户.
#
echo "login user: $USER"
if [ "$USER" = "$root_name" ];then
	echo -e "(adan_shaw@qq.com): \nsuper authority ok, user=$USER."
else
	echo "login user=$USER is not root-user,"
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




cd $tarball_home/build
cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$install_path

make
make install

# 弥补cmake 的错误
cd $install_path/include
find $install_path/include -name "*.h" -exec mv {} . \;
rm -r $install_path/include/lib

mv $install_path/lib/libWjCryptLibEx.so $install_path/lib/libWjCryptLib.so



# 执行模块测试:
$install_path/bin/test



# 执行安装
ln -s $install_path/include /usr/local/include/WjCryptLib
ln -s $install_path/lib/libWjCryptLib.so /usr/local/lib
ln -s $install_path/lib/libWjCryptLib.a /usr/local/lib
