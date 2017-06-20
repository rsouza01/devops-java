# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
# client.pp - Database server configuation
#
#
# Author: 	Rodrigo Alvares de Souza
# 					rsouza01@gmail.com
#
#
# History:
# Version 0.1: 2017/06/08 (rsouza) - First version.
#
#


class mysql::client {

	package { "mysql-client":
		ensure => installed,
	}
}
