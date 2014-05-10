class emacs {
  exec { "/bin/echo 'deb https://s3.amazonaws.com/mydebs stable main' >> /etc/apt/sources.list":
    user => root,
    before => Package['my-emacs-24.4'],
  }
  package { "my-emacs-24.4":
    require => Exec['apt-get update'],
  }
}