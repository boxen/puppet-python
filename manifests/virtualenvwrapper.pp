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
    content => template('python/python_venvwrapper.sh.erb')
  }
  # add to the boxen env calls to wrapper.sh file
}
