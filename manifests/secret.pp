# == Class
#
# adldap::secret
#
# == Synopsis
#
# This class stores the username and password of the  Active Directory user 
# account used to join the Linux machine to the Windows domain
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
class adldap::secret {

  $join_username = "YOUR ACTIVE DIRECTORY USERNAME HERE"
  $join_password = "YOUR ACTIVE DIRECTORY PASSWORD HERE""

}
