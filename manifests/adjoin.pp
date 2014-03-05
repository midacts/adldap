# == Class
#
# adldap::adjoin
#
# == Synopsis
#
# This is the main adldap class for joining the Linux machine to 
# your Active Directory Domain
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
class adldap::adjoin {

  require adldap::secret

  exec { 'adjoin':
    command	=> "/usr/bin/net ads join -U ${adldap::secret::join_username}%${adldap::secret::join_password}",
    unless	=> '/usr/bin/net ads testjoin',
    require    => Class['adldap::winbind'],
  }

}
