class loja_virtual::ci {


/** 
    https://stackoverflow.com/questions/37066614/simple-puppet-module-for-java8-for-a-vm-built-with-vagrant
*/
    include loja_virtual

    package { ['git', 'maven2', 'rubygems']:
        ensure => "installed",
    }

    class { 'jenkins':
        config_hash => {
            'JAVA_ARGS' => { 'value' => '-Xmx256m' }
        },
    }


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