# == Class
#
# adldap::samba
#
# == Synopsis
#
# This is the main adldap class for installing samba and managing its
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
class adldap::samba {

  package { 'samba':
    ensure	=> latest,
    require     => Class['adldap::kerberos'],
  }

  file { '/etc/samba/smb.conf':
    ensure	=> present,
    content	=> template('adldap/smb.conf.erb'),
    mode	=> 644,
    owner	=> root,
    group	=> root,
    require	=> Package['samba'],
  }

  service { "${adldap::params::samba_srv}":
    ensure	=> true,
    enable	=> true,
    subscribe	=> File['/etc/samba/smb.conf'],
    notify	=> Service['winbind'],
  }

}
