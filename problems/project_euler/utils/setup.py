from distutils.core import setup, Extension
setup(name='utils', version='0.1', ext_modules=[Extension('utils',['utils.c'])])