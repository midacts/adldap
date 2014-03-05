# == Class 
#
# adldap::kerberos
#
# == Synopsis
#
# This is the main adldap class for installing kerboros and managing its 
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
class adldap::kerberos {

  require adldap::params

  package { "${adldap::params::krb_pkg}":
    ensure	=> latest,
    notify	=> Package["${adldap::params::krb_pam_pkg}"],
  }

  package { "${adldap::params::krb_pam_pkg}":
    ensure	=> latest,
  }

  file { '/etc/krb5.conf':
    ensure	=> present,
    content	=> template('adldap/krb5.conf.erb'),
    mode	=> 640,
    owner	=> root,
    group	=> root,
    require	=> [Package["${adldap::params::krb_pkg}"], Package["${adldap::params::krb_pam_pkg}"]]
  }

} 
