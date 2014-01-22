# Install python from homebrew.
#
# Usage:
#
#     include python

class python {
  include boxen::config
  include homebrew
  include homebrew::config
  include xquartz
  include python::config

  $version = '2.7.6-boxen3'

  homebrew::formula { 'python':
    before => Package['boxen/brews/python']
  }

  package { 'boxen/brews/python':
    ensure  => $version,
    require => Class['xquartz']
  }
}
