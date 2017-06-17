# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
# db.pp - Database server configuation
#
#
# Author: 	Rodrigo Alvares de Souza
# 			rsouza01@gmail.com
#
#
# History:
# Version 0.1: 2017/06/08 (rsouza) - First version.
# Version 0.2: 2017/06/16 (rsouza) - Creating classes
# Version 0.3: 2017/06/16 (rsouza) - Using modules
#
#

include mysql::server

mysql::db { "loja":
	schema => "loja_schema",
	password => "lojasecret",
}
