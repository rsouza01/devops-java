class loja_virtual { 

    class { 'apt':
        always_apt_update => true,
    }
    
    Class['apt'] -> Package <| |>

    apt::ppa { 'ppa:webupd8team/java':}

}