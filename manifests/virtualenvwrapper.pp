# Manage virtualenvs with virtualenvwrapper instead
#
# Usage:
#
#     include python::virtualenvwrapper

class python::virtualenvwrapper {
  include python

  $version = '3.7'

  # Install virtualenvwrapper
  python::pip {
    "virtualenvwrapper==${version}":
      ensure     => present,
      virtualenv => $python::config::global_venv
  }

  file { "${boxen::config::envdir}/python_venvwrapper.sh":
    ensure => absent,
  }

  ->
  boxen::env_script { 'python_virtualenvwrapper':
    ensure   => present,
    content  => template('python/python_venvwrapper.sh.erb'),
    priority => 'lower',
  }
}
