# == Class
#
# adldap
#
# == Synopsis
#
# This is the main adldap class for setting up LDAP capabilities for Linux
# machines to an Active Directory Domain Controller.
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
class adldap {

  require adldap::params

  include adldap::kerberos
  include adldap::samba
  include adldap::winbind
  include adldap::adjoin
  include adldap::pam
  include adldap::sudo

}
