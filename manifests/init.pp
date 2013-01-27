# Install python from homebrew.
#
# Usage:
#
#     include python
class python {
  require boxen::config
  require xquartz

  hombrew::formula { 'python':
    before => Package['boxen/brews/python']
  }

  package { 'boxen/brews/python':
    ensure => '2.7.3'
  }

  file { "${boxen::config::envdir}/python.sh":
    source  => 'puppet:///modules/python/python.sh'
  }

}
