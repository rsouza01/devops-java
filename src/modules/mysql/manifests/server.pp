# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
# server.pp - Database server configuation
#
#
# Author: 	Rodrigo Alvares de Souza
# 			rsouza01@gmail.com
#
#
# History:
# Version 0.1: 2017/06/17 (rsouza) - refactor from db.pp
#
#

class mysql::server {

	package { "mysql-server":
		ensure => installed,
		require => Exec["apt-update"],
	}

	file { "/etc/mysql/conf.d/allow_external.cnf":
		owner => mysql,
		group => mysql,
		mode => 0644,
    	content => template("mysql/allow_ext.cnf"),
		require => Package["mysql-server"],
		notify => Service["mysql"],
	}

	service { "mysql":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Package["mysql-server"],
	}

	exec { "remove-anonymous-user":
		command => "mysql -uroot -e \"DELETE FROM mysql.user WHERE user=''; FLUSH PRIVILEGES\"",
		onlyif => "mysql -u' '",
		path => "/usr/bin",
		require => Service["mysql"],
	}
}
