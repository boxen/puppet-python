class python::pip {
  include homebrew

  homebrew::formula { 'pip':
    source => 'puppet:///modules/python/brews/python-pip.rb',
    before => Package['boxen/brews/python-pip']
  }

  package { 'boxen/brews/python-pip':
    ensure  => '1.2.1-boxen1',
    require => Package['boxen/brews/python']
  }

}
