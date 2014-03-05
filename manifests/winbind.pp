# == Class
#
# adldap::winbind
#
# == Synopsis
#
# This is the main adldap class for installing winbind and managing
# the nsswitch.conf and the PAM configuration files
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
class adldap::winbind {

  package { "${adldap::params::winbind_pkg}":
    ensure	=> latest,
    require	=> Class['adldap::samba'],
    notify	=> Service['winbind'],
  }

  file { '/etc/nsswitch.conf':
    ensure	=> present,
    content	=> template('adldap/nsswitch.conf.erb'),
    mode	=> 644,
    owner	=> root,
    group	=> root,
    require	=> Package["${adldap::params::winbind_pkg}"],
  }

  service { 'winbind':
    ensure      => true,
    enable	=> true,
  }

}
