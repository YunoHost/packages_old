#!/usr/bin/env python
# $Id: setup.py,v 1.25 2009/11/30 22:40:05 ghantoos Exp $
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

from distutils.core import setup

if __name__ == '__main__':

    setup(name='yunohost-cli',
        version='1.0.0',
        description='Yunohost CLI',
        author='Yunohost Team',
        author_email='yunohost@yunohost.org',
        maintainer='Adrien Beudin (beudbeud)',
        maintainer_email='beudbeud@yunohost.org',
        url='http://yunohost.org',
        license='GPL',
        scripts = [('src/yunohost-cli/bash/yunohost','src/yunohost-cli/bash/checkupdate')],
	packages=['yunohost-cli'],
	package_dir={'yunohost-cli': 'src/yunohost-cli'},
	package_data={'yunohost-cli': ['*.py', '*.yml', '*.tac']},
        data_files = [('share/yunohost-cli/doc',['src/yunohost-cli/LICENSE', 'src/yunohost-cli/README.md']),
		('share/pyshared/yunohost-cli',['src/yunohost-cli/yunohost']),
		('/usr/share/yunohost/',['src/yunohost-cli/config/upgrade']),
		('/etc/bash_completion.d/',['src/yunohost-cli/bash/yunohost_cli'])],
	)

    setup(name='txrestapi',
        version='0.1',
        description="Easing the creation of REST API services in Python",
        author='Ian McCracken',
        author_email='ian.mccracken@gmail.com',
        url='http://github.com/iancmcc/txrestapi',
        license='MIT',
	packages=['txrestapi'],
        package_dir={'txrestapi': 'src/yunohost-cli/txrestapi'},
        package_data={'txrestapi': ['*.py']}
      )
