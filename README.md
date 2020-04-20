# 文件说明


* README.md				本说明文件
* LICENSE.md			授权说明文件
* elpa					elpa插件安装目录
* lisp              	配置文件目录
  * dired-conf.el		dired的相关函数和配置
  * diredful-conf.el	diredful相关的配置信息
  * emacs.el			主配置文件
  * install.el			安装文件，用于初始安装elpa
  * linux.el			linux下的配置文件
  * locals.el			本地配置文件，如果存在则加载
  * mac.el				mac下的配置文件
  * setup.el			默认配置参数，包括插件载入和配置
  * users.el			自定义函数
  * win.el				windows下的配置文件
* plugins				插件安装目录，安装elpa中没有的文件，目前只有三个插件。
* snippets				缩写数据目录
* templates				自动建立模板目录

# INSTALL

	copy dir to ~/.emacs.d/
	make

注:

	make clean ;清理安装目录
	make install ;安装配置

# 依赖

* dired-x
* diredful
* etags-table
* go-mode
* markdown-mode
* multi-term
* python
* rst-mode

# 推荐

* auto-complete
* bookmark
* color-theme
* dictionary
* ediff
* elpy
* ispell
* markdown
* template
* tramp
* uniquify
* yasnippet

# Misc

go-autocomplete可能无法自动make，需要手工安装。

系统中需要有godef和gocode。两者可以放在~/bin/下面，也可以自行添加$PATH。需要修改exec-path，默认在setup.el中已经配置。

go的几个依赖组件安装方法请参考Makefile的install-golang一节。

# TODO

* replace template with yatemplate
* python mode goes wrong
* golang mode goes wrong
* split emacs-goodies-el
