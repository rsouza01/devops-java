# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
# web.pp - Web server configuation
#
#
# Author: 	Rodrigo Alvares de Souza
# 					rsouza01@gmail.com
#
#
# History:
# Version 0.1: 2017/06/?? (rsouza) - First version.
# Version 0.1: 2017/06/17 (rsouza) - Refactoring
#
#

include mysql::client
include tomcat::server

$keystore_file = "/etc/ssl/.keystore"

$ssl_connector = {
	"port" => 8443,
	"protocol" => "HTTP/1.1",
	"SSLEnabled" => true,
	"maxThreads" => 150,
	"scheme" => "https",
	"secure" => "true",
	"keystoreFile" => $keystore_file,
	"keystorePass" => "secret",
	"clientAuth" => false,
	"sslProtocol" => "SSLv3",
}

$db_host = "192.168.33.10"
$db_schema = "loja_schema"
$db_user = "loja"
$db_password = "lojasecret"


exec { "apt-update":
	command => "/usr/bin/apt-get update"
}

file { $keystore_file:
	mode => 0644,
	source => "/vagrant/manifests/.keystore",
}

class { "tomcat::server":
	connectors => [$ssl_connector],
	require => File[$keystore_file],
}


file { "/var/lib/tomcat7/conf/context.xml":
	owner => root,
	group => tomcat7,
	mode => 0644,
	content => template("/vagrant/manifests/context.xml"),
	require => Package["tomcat7"],
	notify => Service["tomcat7"],
}

file { "/var/lib/tomcat7/webapps/devopsnapratica.war":
	owner => tomcat7,
	group => tomcat7,
	mode => 0644,
	source => "/vagrant/manifests/devopsnapratica.war",
	require => Package["tomcat7"],
	notify => Service["tomcat7"],
}
