exec { "apt-update":
	command => "/usr/bin/apt-get update"
}

package { "mysql-server":
	ensure => installed,
	require => Exec["apt-update"],
}
