# encoding: utf-8
#!/usr/bin/env python

from distutils.core import setup
from subprocess import call
import sys
import logging
from os import path

# read long_description from README.rst
long_description = None
try:
    long_description = open('README.rst').read()
    long_description += '\n' + open('CHANGES.rst').read()
except IOError:
    pass


theme_base = path.join(sys.prefix, 'share/icons/hicolor')
icon_resolutions = ([('scalable', 'svg')] +
                    [('{0}x{0}'.format(res), 'png') for res in [16]])
icon_classes = {'actions': ('mount', 'unmount',
                            'lock', 'unlock',
                            'eject', 'detach')}

setup(
    name='udiskie',
    version='0.6.4',
    description='Removable disk automounter for udisks',
    long_description=long_description,
    author='Byron Clark',
    author_email='byron@theclarkfamily.name',
    maintainer='Thomas Gläßle',
    maintainer_email='t_glaessle@gmx.de',
    url='https://github.com/coldfix/udiskie',
    license='MIT',
    packages=[
        'udiskie',
    ],
    data_files=[
        (path.join(theme_base, icon_resolution, icon_class), [
            path.join('icons', icon_resolution, icon_class,
                      'udiskie-%s.%s' % (icon_name, icon_ext))
            for icon_name in icon_names])
        for icon_resolution,icon_ext in icon_resolutions
        for icon_class,icon_names in icon_classes.items()
    ],
    entry_points={
        'console_scripts': [
            'udiskie = udiskie.cli:Daemon.main',
            'udiskie-mount = udiskie.cli:Mount.main',
            'udiskie-umount = udiskie.cli:Umount.main',
        ],
    },
    install_requires=[
        # Currently not building out of the box:
        # 'PyGObject',
        # 'dbus-python',
        # 'pygtk>=2.10',
    ],
    tests_require=[
        'python-dbusmock>=0.7.2'
    ],
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Environment :: Console',
        'Environment :: X11 Applications',
        'Intended Audience :: Developers',
        'Intended Audience :: End Users/Desktop',
        'Operating System :: POSIX :: Linux',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.3',
        'License :: OSI Approved :: MIT License',
        'Topic :: Desktop Environment',
        'Topic :: Software Development',
        'Topic :: System :: Filesystems',
        'Topic :: System :: Hardware',
        'Topic :: Utilities',
    ],
)
