# == Class
#
# adldap::params
#
# == Synopsis
#
# This is the main adldap class containing all parameters for adldap classes
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
class adldap::params {

  case $::operatingsystem {
    redhat, centos: {
      $krb_pkg		= "krb5-workstation"
      $krb_pam_pkg 	= "pam_krb5"
      $samba_srv	= "smb"
      $winbind_pkg	= "samba-winbind"
      $pam_sudo_file    = 'sudo.el'
    }

    debian, ubuntu: {
      $krb_pkg 		= "krb5-user"
      $krb_pam_pkg      = "libpam-krb5"
      $samba_srv	= "samba"
      $winbind_pkg	= "winbind"
      $pam_sudo_file	= 'sudo.deb'
    }

  }

}
