# Create virtual environments with virtualenvwrapper
#
# Usage:
#
#     in one of your classes...
#     python::mkvirtualenv{ 'name_of_venv':
#       ensure      => present,
#       systempkgs  => false,
#       distribute  => true,
#       project_dir => "path_to_associated_project"
#     }
#
#
# Parameter:
#   [ensure]
#     Must be present or absent. Default: present
#   [systempkgs]
#     true or false. Determines whether or not to enable the global site
#     pacakges. Default: false
#   [distribute]
#     true or false. Determines if Setuptools or Distribute is installed.
#     Default: true
#   [project_dir]
#     string. Set the project directory associated with venv being created.
#     Default: undef
#
#
# Notes:
#   The project does not have to exist before creating the virutal env, but if
#   it's not created by the end of the run activating the venv will throw nasty
#   errors.


define python::mkvirtualenv (
  $ensure      = present,
  $systempkgs  = false,
  $distribute  = true,
  $project_dir = undef
){
  $venv_path = "${python::config::venv_home}/${name}"
  case $ensure {
    'present': {
      $mkvenv_proj = $project_dir ? {
        undef   => '',
        default => "-a ${project_dir}"
      }

      $mkvenv_syspkg = $systempkgs ? {
        true    => '--system-site-packages',
        default => ''
      }

      exec{ "python_mkvirtualenv_${name}":
        command  => ". ${boxen::config::home}/env.sh && \
          mkvirtualenv ${mkvenv_proj} ${name} ${mkvenv_syspkg}",
        provider => 'shell',
        user     => $::boxen_user,
        creates  => $venv_path,
        require => [File["${boxen::config::envdir}/python_venvwrapper.sh"],
          Class["python::virtualenvwrapper"]]
      }
    }
    'absent' : {
      if !defined(File[$venv_path]){
        file { $venv_path:
          ensure  => absent,
          recurse => true,
          force   => true,
          backup  => false
        }
      }
    }
    default: { fail('Invalid ensure option') }
  }
}
