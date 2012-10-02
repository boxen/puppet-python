class python {
  require xquartz

  package { 'python':
    ensure => latest
  }

  file { "${github::config::envdir}/python.sh":
    source  => 'puppet:///modules/python/python.sh',
    require => File[$github::config::envdir]
  }
}
