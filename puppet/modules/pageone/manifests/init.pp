class pageone(
  $sys_packages    = [ 'build-essential', 'curl', 'vim']
) {
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  exec { 'apt-get update':
    command => 'apt-get update',
  }

  class { 'apt':
    update => { 'frequency' => 'always' }
  }

  package { ['python-software-properties']:
    ensure  => 'installed',
    require => Exec['apt-get update'],
  }

  package { $sys_packages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
  
  class { "apache": }
}
