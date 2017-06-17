# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
# db.pp - Database server configuation (via modules)
#
#
# Author: 	Rodrigo Alvares de Souza
# 					rsouza01@gmail.com
#
#
# History:
# Version 0.1: 2017/06/17 (rsouza) - Refactor from db.pp.
#
#

define mysql::db($schema, $user = $title, $password) {
	Class['mysql::server'] -> Mysql::Db[$title]

	exec { "$title-schema":
		unless => "mysql -uroot $schema",
		command => "mysqladmin -uroot create $schema",
		path => "/usr/bin/",
	}

	exec { "$title-user":
		unless => "mysql -u$user -p$password $schema",
		command => "mysql -uroot -e \"GRANT ALL PRIVILEGES ON $schema.* TO '$user'@'%' IDENTIFIED BY '$password';\"",
		path => "/usr/bin/",
		require => Exec["$title-schema"],
	}
}
