class emacs {
  package { "my-emacs-24.4":
    ensure => installed,
    require => File['/etc/apt/apt.conf.d/99auth'],
    before => File['turn_auth_back_on'],
  }

  file { "/etc/apt/apt.conf.d/99auth":
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