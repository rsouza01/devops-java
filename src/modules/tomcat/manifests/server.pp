# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
# server.pp - Web server configuation
#
#
# Author: 	Rodrigo Alvares de Souza
# 					rsouza01@gmail.com
#
#
# History:
# Version 0.1: 2017/06/17 (rsouza) - First version.
#
#

class tomcat::server {

	package { "tomcat7":
		ensure => installed,
		require => Exec["apt-update"],
	}

	file { "/etc/default/tomcat7":
		owner => root,
		group => root,
		mode => 0644,
		source => "/vagrant/manifests/tomcat7",
		require => Package["tomcat7"],
		notify => Service["tomcat7"],
	}

	service { "tomcat7":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Package["tomcat7"],
	}



}
