# == Class
#
# adldap::sudo
#
# == Synopsis
#
# This is the main adldap class for installing sudo and managing its
# configuration file
#
# == Author
#
# John McCarthy <midactsmystery@gmail.com>
#
# - http://www.midactstech.blogspot.com -
# - https://www.github.com/Midacts -
#
# == Date
#
# 5th of March, 2014
#
# -- Version 1.0 --
#
class adldap::sudo {

  require adldap::params

  package { 'sudo':
    ensure	=> latest,
    require	=> Class['adldap::pam'],
  }

  file { '/etc/pam.d/sudo':
    ensure	=> present,
    content	=> template("adldap/${adldap::params::pam_sudo_file}.erb"),
    mode	=> 640,
    owner	=> root,
    group	=> root,
    require	=> Package['sudo'],
  }

  file { '/etc/sudoers':
    ensure      => present,
    content     => template('adldap/sudoers.erb'),
    mode        => 640,
    owner       => root,
    group       => root,
    require	=> File['/etc/pam.d/sudo'],
  }

  file { '/home/EXAMPLE':
    ensure	=> directory,
    require	=> File['/etc/sudoers'],
  }

}
