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

  $version = '2.7.3-boxen2'

  homebrew::formula { 'python':
    before => Package['boxen/brews/python']
  }

  package { 'boxen/brews/python':
    ensure  => $version,
    require => Class['xquartz']
  }

  file {
    "${homebrew::config::installdir}/lib/python2.7":
      ensure => directory ;
    "${homebrew::config::installdir}/lib/python2.7/site-packages":
      ensure  => link,
      force   => true,
      target  => "${homebrew::config::installdir}/Cellar/python/${version}/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages",
      require => Package['boxen/brews/python'] ;
  }

  file { "${boxen::config::envdir}/python.sh":
    source  => 'puppet:///modules/python/python.sh'
  }
}
