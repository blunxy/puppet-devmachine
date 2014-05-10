class emacs {
  package { "my-emacs-24.4":
    ensure => installed,
    require => File['/etc/apt/apt.conf.d/99auth'],
#    before => Exec['turn_auth_back_on'],
  }

  file { "/etc/apt/apt.conf.d/99auth":
    owner     => root,
    group     => root,
    content   => "APT::Get::AllowUnauthenticated yes;",
    mode      => 644,
  }

#  exec { "turn_auth_back_on":
 #   command => "sudo /bin/rm -f /etc/apt/apt.conf.d/99auth",
 # }
}