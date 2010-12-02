#!/usr/bin/python
# -*- coding: utf-8 -*-
# @date: 2009-06-25
# @author: shell.xu
from __future__ import with_statement
import os
import sys
import platform
from os import path

if platform.system () == 'Windows':
    etags_path = 'C:\\Program Files\\emacs\\bin\\etags.exe'
elif platform.system () == 'Linux':
    etags_path = '/usr/bin/etags'
else:
    etags_path = os.popen ("which etags", "r").read ().strip ()
ext_list = [".c", ".cpp", ".cxx", ".h", ".hpp", ".py"]

def walk_tag (base_path, target_path):
    ''' '''
    for dirpath, dirnames, filenames in os.walk (base_path):
        for filename in filenames:
            fullname = path.join (dirpath, filename)
            bProc = False
            for ext in ext_list:
                if fullname.lower ().endswith (ext):
                    bProc = True
                    break
            if bProc:
                if platform.system () == 'Windows':
                    params = ('etags.exe', '"%s"' % fullname, "--members",
                              "-a", "-o", '"%s"' % target_path)
                elif platform.system () == 'Linux':
                    params = ('etags', fullname, "--members",
                              "-a", "-o", target_path)
                else: # warning this error is safe
                    params = None
                os.spawnv (os.P_WAIT, etags_path, params)
                

def gen_tag_table (cur_dir):
    """ """
    target_path = path.join (cur_dir, "TAGS")
    try:
        os.remove (target_path)
    except OSError:
        pass
    walk_tag (cur_dir, target_path)

if __name__ == "__main__":
    if len (sys.argv) < 2:
        gen_tag_table (os.getcwd ())
    else:
        gen_tag_table (sys.argv[1])
