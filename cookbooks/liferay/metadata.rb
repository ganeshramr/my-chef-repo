name             'liferay'
maintainer       'ganeshramr'
maintainer_email 'mailganesh@icould.com'
license          'All rights reserved'
description      'Cookbook for liferay in-memory db version.Runs on precise64 3.2.0-23-generic Vagrant image'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.3'
supports 'ubuntu'

depends 'tomcat', '~> 0.17.3'
