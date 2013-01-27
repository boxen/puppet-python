class python::distribute {

  homebrew::formula { 'distribute':
    before => Package['boxen/brews/python-distribute']
  }

  package { 'boxen/brews/python-distribute':
    ensure  => '0.6.30-boxen1',
    require => Package['boxen/brews/python']
  }

}
