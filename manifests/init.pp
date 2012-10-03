class python {
  require xquartz

  package { 'python':
    ensure => latest
  }

  file { "${boxen::config::envdir}/python.sh":
    source  => 'puppet:///modules/python/python.sh',
    require => File[$boxen::config::envdir]
  }
}
