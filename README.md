# 文件说明


* README.md				本说明文件
* LICENSE.md			授权说明文件
* lisp              	配置文件目录
  * emacs.el			主配置文件
  * linux.el			linux下的配置文件
  * win.el				windows下的配置文件
  * keymap.el			用于全局键盘映射
  * locals.el			本地配置文件，如果存在则加载
  * setup.el			默认配置参数，包括插件载入和配置
  * userfunc.el			自定义函数
  * dired-conf.el		dired的相关函数和配置
  * diredful-conf.el	diredful相关的配置信息
* plugins				插件安装目录
* snippets				缩写数据目录
* templates				自动建立模板目录

# INSTALL

	copy dir to ~/.emacs.d/
	make

注:

	make clean ;清理安装目录
	make install ;安装配置

# 推荐安装

debian的依赖可以参考Makefile的install-deb一节。其他推荐：

* php-elisp
* slime

# Misc

go-autocomplete可能无法自动make，需要手工安装。

系统中需要有godef和gocode。两者可以放在~/bin/下面，也可以自行添加$PATH。需要修改exec-path，默认在setup.el中已经配置。

go的几个依赖组件安装方法请参考Makefile的install-golang一节。

# TODO

* replace template with yatemplate
* python mode goes wrong
* golang mode goes wrong
* split emacs-goodies-el
