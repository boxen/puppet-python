# Install python from homebrew.
#
# Usage:
#
#     include python
class python {
  require boxen::config
  require xquartz

  package { 'python':
    ensure => latest
  }

  file { "${boxen::config::envdir}/python.sh":
    source  => 'puppet:///modules/python/python.sh'
  }
}
