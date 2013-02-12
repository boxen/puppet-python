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

  $version = '2.7.3-boxen1'

  homebrew::formula { 'python':
    before => Package['boxen/brews/python']
  }

  package { 'boxen/brews/python':
    ensure  => $version,
    require => Class['xquartz']
  }

  file { "${homebrew::config::installdir}/Cellar/python/${version}/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages":
    force   => true,
    ensure  => link,
    target  => "${homebrew::config::installdir}/lib/python2.7/site-packages",
    require => Package['boxen/brews/python']
  }

  file { "${boxen::config::envdir}/python.sh":
    source  => 'puppet:///modules/python/python.sh'
  }

  include python::distribute
  include python::pip
}
