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

  $version = '2.7.8-boxen1'

  homebrew::formula { 'python':
    before => Package['boxen/brews/python']
  }

  package { 'boxen/brews/python':
    ensure  => $version,
    require => Class['xquartz']
  }

  boxen::env_script { 'python':
    ensure   => 'absent',
    content  => '# noop',
  }

  file { "${boxen::config::envdir}/python.sh":
    ensure => absent,
  }
}
