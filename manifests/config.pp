# Config variables for the python module

class python::config {
  include boxen::config

  $venv_home = "${boxen::config::datadir}/virturalenvs"
  # The "global" scope for python modules in boxen
  $global_venv = $homebrew::config::installdir
}
