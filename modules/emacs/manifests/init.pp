class emacs {
  package { "my-emacs-24.4":
    ensure => installed,
    require => File['turn_auth_off'],
    before => File['turn_auth_back_on'],
  }

  file { "turn_auth_off":
    path => "/etc/apt/apt.conf.d/99auth":
    owner     => root,
    group     => root,
    content   => "APT::Get::AllowUnauthenticated yes;",
    mode      => 644,
  }

  file { "turn_auth_back_on":
    path => "/etc/apt/apt.conf.d/99auth",
    ensure => absent,
  }
}