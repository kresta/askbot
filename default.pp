file { 'puppet.conf':
    path    => '/etc/puppet/puppet.conf',
    ensure  => file,
    content => "[main]
    # The Puppet log directory.
    # The default value is '$vardir/log'.
    logdir = /var/log/puppet
    # Where Puppet PID files are kept.
    # The default value is '$vardir/run'.
    rundir = /var/run/puppet
    # Where SSL certificates are kept.
    # The default value is '$confdir/ssl'.
    ssldir = $vardir/ssl
    
    [master]
    autosign = true
    [agent]
    # The file in which puppetd stores a list of the classes
    # associated with the retrieved configuratiion.  Can be loaded in
    # the separate ``puppet`` executable using the ``--loadclasses``
    # option.
    # The default value is '$confdir/classes.txt'.
    classfile = $vardir/classes.txt
    # Where puppetd caches the local configuration.  An
    # extension indicating the cache format is added automatically.
    # The default value is '$confdir/localconfig'.
    localconfig = $vardir/localconfig",
    mode    => 0644,
    owner   => root,
    group   => root
}

package { 'epel-release':
    ensure => latest,
    name   => 'epel-release'
}

package { 'nginx':
    ensure => latest,
    name   => 'nginx',
    require => Package['epel-release']
}

package { 'fabric':
    ensure => latest,
    name   => 'fabric',
    require => Package['epel-release']
}

package { 'uwsgi':
    ensure => latest,
    name   => 'uwsgi',
    require => Package['epel-release']
}

package { 'vim-enhanced':
    ensure => latest,
    name   => 'vim-enhanced'
}    

package { 'postgresql':
    ensure => latest,
    name   => 'postgresql'
}    

package { 'git':
    ensure => latest,
    name   => 'git'
}    

package { 'python-virtualenv':
    ensure => latest,
    name   => 'python-virtualenv'
}    

package { 'gcc':
    ensure => latest,
    name   => 'gcc'
}    

service { 'nginx.service':
    ensure    => running,
    enable    => true,
    name      => 'nginx',
#    subscribe => File['nginx.conf'],
    require   => Package['nginx']
}