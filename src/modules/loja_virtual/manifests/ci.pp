class loja_virtual::ci {

    include loja_virtual

    package { ['mc', 'git', 'maven']:
        ensure => "installed",
    }


    class { 'jenkins':
        config_hash => {
            'JAVA_ARGS' => { 'value' => '-Xmx256m' }
        },
    }

    $plugins = [
        'ssh-credentials',
        'scm-api',
        'git-client',
        'git',
        'maven-plugin',
        'javadoc',
        'mailer',
        'greenballs',
        'ws-cleanup',
        'parameterized-trigger',
        'copyartifact',
		'junit',
        'workflow-scm-step',
		'conditional-buildstep',
		'workflow-durable-task-step',
		'resource-disposer',
		'structs',
		'display-url-api',
		'matrix-project',
        'script-security',
        'workflow-api',
        'workflow-step-api',
        'workflow-support',
        'durable-task',
        'run-condition',
        'token-macro'
    ]

    jenkins::plugin { $plugins: }

    file { '/var/lib/jenkins/hudson.tasks.Maven.xml':
        mode => 0644,
        owner => 'jenkins',
        group => 'jenkins',
        source => 'puppet:///modules/loja_virtual/hudson.tasks.Maven.xml',
        require => Class['jenkins::package'],
        notify => Service['jenkins'],
    }

    $git_repository = 'https://github.com/rsouza01/devops-java-app'
    $git_poll_interval = '* * * * *'
    $maven_goal = 'package'
    $archive_artifacts = 'combined/target/*.war'
    $root_POM = 'src/DevopsJavaApp/pom.xml'


    $job_structure = [
        '/var/lib/jenkins/jobs/devops-java-app'
    ]


    file { $job_structure:
        ensure => 'directory',
        owner => 'jenkins',
        group => 'jenkins',
        require => Class['jenkins::package'],
    }

    file { '/var/lib/jenkins/jobs/devops-java-app/config.xml':
        mode => 0644,
        owner => 'jenkins',
        group => 'jenkins',
        content => template('loja_virtual/config.xml'),
        notify => Service['jenkins'],
        require => File[$job_structure]
    }

}
