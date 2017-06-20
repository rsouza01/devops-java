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

class tomcat::server($connectors = [], , $data_sources = []) {

	package { "tomcat7":
		ensure => installed,
	}

	file { "/etc/default/tomcat7":
		owner => root,
		group => tomcat7,
		mode => 0644,
    	source  => "puppet:///modules/tomcat/tomcat7",
		require => Package["tomcat7"],
		notify => Service["tomcat7"],
	}

	file { "/var/lib/tomcat7/conf/server.xml":
		owner => root,
		group => tomcat7,
		mode => 0644,
		content => template("tomcat/server.xml"),
		require => Package["tomcat7"],
		notify => Service["tomcat7"],
	}

	file { "/var/lib/tomcat7/conf/context.xml":
		owner => root,
		group => tomcat7,
		mode => 0644,
		content => template("tomcat/context.xml"),
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
