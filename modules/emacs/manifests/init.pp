class emacs {
  package { "my-emacs-24.4":
    ensure => installed,
    require => File['turn_auth_off'],
    before => Exec['turn_auth_on'],
  }

  file { "turn_auth_off":
    path => "/etc/apt/apt.conf.d/99auth",
    owner     => root,
    group     => root,
    content   => "APT::Get::AllowUnauthenticated yes;",
    mode      => 644,
  }

  exec { "turn_auth_on":
    command => "/usr/bin/sudo /bin/rm -f /etc/apt/apt.conf.d/99auth",
    require => File['turn_auth_off'],
  }
}