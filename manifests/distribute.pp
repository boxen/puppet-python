class python::distribute {

  hombrew::formula { 'distribute':
    before => Package['boxen/brews/python-distribute']
  }

  package { 'boxen/brews/python-distribute':
    ensure => '0.6.30',
    require => Package['boxen/brews/distribute']
  }

}
