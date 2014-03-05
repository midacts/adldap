# == Class
#
# adldap::pam
#
# == Synopsis
#
# This is the main adldap class for setting up the modified PAM
# configuration files for Active Directory Authentication on Linux
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
class adldap::pam {

  case $operatingsystem {
    debian,ubuntu: {

      file { '/etc/pam.d/common-account':
        ensure	=> present,
        content	=> template('adldap/common-account.erb'),
        mode	=> 640,
        owner	=> root,
        group	=> root,
        require	=> Class['adldap::adjoin'],
      }

      file { '/etc/pam.d/common-auth':
        ensure	=> present,
        content	=> template('adldap/common-auth.erb'),
        mode	=> 640,
        owner	=> root,
        group	=> root,
        require	=> File['/etc/pam.d/common-account'],
      }

      file { '/etc/pam.d/common-session':
        ensure	=> present,
        content	=> template('adldap/common-session.erb'),
        mode	=> 640,
        owner	=> root,
        group	=> root,
        require	=> File['/etc/pam.d/common-auth'],
      }

    }

    redhat,centos: {

      file { '/etc/pam.d/system-auth':
      ensure      => present,
      content     => template('adldap/system-auth.erb'),
      mode        => 640,
      owner       => root,
      group       => root,
      require     => Class['adldap::adjoin'],
      }

      file { '/etc/pam.d/sshd':
      ensure      => present,
      content     => template('adldap/sshd.erb'),
      mode        => 640,
      owner       => root,
      group       => root,
      require     => File['/etc/pam.d/system-auth'],
      }

    }

  }

}
