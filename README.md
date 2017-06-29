<h1 align="center">
	<br><img src="logo.jpg" alt="logo"><br>

	DevOps-Java
</h1>


#

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

## COMMANDS

* Start the VMs:

	vagrant up
	vagrant up <SERVER>

* Shutdown the VMs:

	vagrant halt

* Destroy VMs:

	vagrant destroy <SERVER>

* Change VM's after running:

	vagrant provision <SERVER>

* Boxes (using [bento](https://app.vagrantup.com/bento) boxes)

	vagrant list boxes

	vagrant box add <BOX_NAME>

	vagrant box remove <BOX_NAME>

* SSH

	vagrant ssh <SERVER>
	vagrant ssh db
	vagrant ssh web

* Increase MAVEN memory BEFORE build

	vagrant@web$ export MAVEN_OPTS=-Xmx1536m

* Tomcat Folders

	Config: /etc/default/tomcat7/

	JAVA_OPTS="-Djava.awt.headless=true -Xmx1024M -XX:+UseConcMarkSweepGC"

	Applications: /var/lib/tomcat7/webapps/

* Tomcat Commands
	Stop: sudo service tomcat7 stop

	Restart: sudo service tomcat7 restart

* [Application](http://192.168.33.12:8080/devopsnapratica/ )


* [Nagios Dashboard](http://192.168.33.14/nagios3/)


## [Book on Google Books](https://books.google.com.br/books?id=Cm2CCwAAQBAJ)

## PROBLEMS

* On 'vagrant up' error:


	Vagrant attempted to execute the capability 'configure_networks'on the detect guest OS 'linux', but the guest doesn't support that capability. This capability is required for your configuration of Vagrant. Please either reconfigure Vagrant to avoid this capability or fix the issue by creating the capability.

	see https://stackoverflow.com/questions/38636023/vagrant-not-supported-the-capability-change-host-name.


* On first Maven build error:

	Vagrantfile

	config.vm.provider :virtualbox do |vb|
	  vb.customize ["modifyvm", :id, "--memory", "1536"]
	end

	ssh

	export MAVEN_OPTS=-Xmx1024m

* On Jenkins installation:

	==> ci: err: /Stage[main]/Jenkins::Package/Package[jenkins]/ensure: change from purged to present failed: Execution of '/usr/bin/apt-get -q -y -o DPkg::Options::=--force-confold install jenkins' returned 100: Reading package lists...
	==> ci: Building dependency tree...
	==> ci: Reading state information...
	==> ci: Some packages could not be installed. This may mean that you have
	==> ci: requested an impossible situation or if you are using the unstable
	==> ci: distribution that some required packages have not yet been created
	==> ci: or been moved out of Incoming.
	==> ci: The following information may help to resolve the situation:
	==> ci: The following packages have unmet dependencies:
	==> ci:  jenkins : Depends: default-jre-headless (>= 2:1.8) but it is not going to be 				 installed or java8-runtime-headless but it is not installable
	==> ci: E: Unable to correct problems, you have held broken packages.
