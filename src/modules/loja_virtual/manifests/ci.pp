class loja_virtual::ci {

    include loja_virtual

/*
    package { ['git', 'maven2', 'build-essential']:
        ensure => "installed",
    }

    class { 'jenkins':
        config_hash => {
            'JAVA_ARGS' => { 'value' => '-Xmx256m' }
        },
    }
*/

/*

    $plugins = [
        'ssh-credentials',
        'credentials',
        'scm-api',
        'git-client',
        'git',
        'maven-plugin',
        'javadoc',
        'mailer',
        'greenballs',
        'ws-cleanup',
        'parameterized-trigger',
        'copyartifact'
    ]
    
    jenkins::plugin { $plugins: }
    */
}