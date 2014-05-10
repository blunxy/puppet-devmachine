class ruby2 {
    $oldpacks = ["ruby","ruby1.8","ruby1.9.1","libruby","libruby1.8","libruby1.9.1"]
    package { $oldpacks: ensure => "purged }
}