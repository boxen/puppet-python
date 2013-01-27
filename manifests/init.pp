# Install python from homebrew.
#
# Usage:
#
#     include python
class python {
  require boxen::config
  require homebrew
  require xquartz

  homebrew::formula { 'python':
    before => Package['boxen/brews/python']
  }

  package { 'boxen/brews/python':
    ensure => '2.7.3-boxen1'
  }

  file { "${boxen::config::envdir}/python.sh":
    source  => 'puppet:///modules/python/python.sh'
  }

  include python::distribute
  include python::pip

}
