#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
@date: 2009-06-25
@author: shell.xu
'''
import os
import sys
import platform
from os import path

sys_platform = platform.system()
if sys_platform == 'Windows':
    etags_path = 'C:\\Program Files\\emacs\\bin\\etags.exe'
else: etags_path = os.popen("which etags", "r").read().strip()

ext_list = set(['.c', '.cpp', '.cxx', '.h', '.hpp', '.py', '.java'])

def proc_file(fullpath, target_path):
    if sys_platform == 'Windows':
        params = ('etags.exe', fullpath, '-a', '-o', target_path)
    elif sys_platform == 'Linux':
        params = ('etags', fullpath, '-a', '-o', target_path)
    else: raise Exception('platform not support')
    os.spawnv(os.P_WAIT, etags_path, params)

def gen_tag_table(cur_dir):
    target_path = path.join(cur_dir, 'TAGS')
    try: os.remove(target_path)
    except OSError: pass
    for dirpath, dirnames, filenames in os.walk(cur_dir):
        for filename in filenames:
            if path.splitext(filename)[1].lower() in ext_list:
                proc_file(path.join(dirpath, filename), target_path)

if __name__ == '__main__':
    if len(sys.argv) == 1: gen_tag_table(os.getcwd())
    elif len(sys.argv) == 2: gen_tag_table(sys.argv[1])
    elif len(sys.argv) > 2:
        target_path = path.join(sys.argv[1], 'TAGS')
        for filepath in sys.argv[2:]: proc_file(filepath, target_path)
