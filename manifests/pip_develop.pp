# Equivelent to pip install -e [directory], which is similar to
# python setup.py develop
#
# Usage:
#
#     in one of your classes...
#     python::pip_develop{ 'name_of_venv':
#       virtualenv => "my_venv"
#     }
#
# Parameter:
#   [virtualenv]
#     Name of the virutal env to use (from python::mkvirtualenv)
#
#   [path]
#     The base path of where to fine [name], e.g. the leading path component.
#     E.g. a repo at /home/pcollins/workspace/Website would have path set to
#     /home/pcollins/workspace

define python::pip_develop (
  $virtualenv,
  $path,
  $force = false,
  $timeout = 300
){
  require python

  $venv_path = "${python::config::venv_home}/${virtualenv}"

  case $force {
    true:  {
      exec{ "pip install -e ${name}":
        command => "${venv_path}/bin/pip install -e ${path}/${name}",
        require => Class['python::virtualenvwrapper'],
        timeout => $timeout
      }
    }
    default: {
      exec{ "pip install -e ${name}":
        command => "${venv_path}/bin/pip install -e ${path}/${name}",
        creates => "${venv_path}/lib/python2.7/site-packages/${name}.egg-link",
        require => Class['python::virtualenvwrapper'],
        timeout => $timeout
      }
    }
  }
}
