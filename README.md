![Logo](logo.jpg)

# DevOps-Java

Small tutorial for DevOps and Java


## Steps

1.Setting the production environment.
- [x] [Virtual Box](http://www.virtualbox.org)
- [x] [Vagrant](https://www.vagrantup.com/downloads.html)
- [x] Vagrant Ubuntu Image(vagrant box add hashicorp/precise32)
- [x] Vagrant up!
- [x] db:mysql and web:tomcat installed.


## MySQL

* Remove anonymous account:

	mysql -uroot -p -e "DELETE FROM mysql.user WHERE user=''; FLUSH PRIVILEGES"

* Creates app user:

	mysql -uroot -p -e "GRANT ALL PRIVILEGES ON loja_schema.* TO 'loja'@'%' IDENTIFIED BY 'lojasecret';"

* Test new user:

	mysql -u loja -p loja_schema -e "select database(), user()"



## [Book on Google Books](https://books.google.com.br/books?id=Cm2CCwAAQBAJ)

## PROBLEMS

* On 'vagrant up' error:


	Vagrant attempted to execute the capability 'configure_networks'on the detect guest OS 'linux', but the guest doesn't support that capability. This capability is required for your configuration of Vagrant. Please either reconfigure Vagrant to avoid this capability or fix the issue by creating the capability.

	see https://stackoverflow.com/questions/38636023/vagrant-not-supported-the-capability-change-host-name.


