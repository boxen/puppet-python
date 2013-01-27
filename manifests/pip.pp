class python::pip {
  require homebrew

  homebrew::formula { 'pip':
    before => Package['boxen/brews/python-pip']
  }

  package { 'boxen/brews/python-pip':
    ensure => '1.2.1-boxen1',
    require => Package['boxen/brews/python']
  }

}
