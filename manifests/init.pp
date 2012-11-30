# Install python from homebrew.
#
# Usage:
#
#     include python
class python {
  require boxen::config
  require xquartz

  package {
    'python':
      ensure => latest;
    ['python-distribute', 'python-pip']
      require => Package['python'] ;
  }

  file { "${boxen::config::envdir}/python.sh":
    source  => 'puppet:///modules/python/python.sh'
  }
}
