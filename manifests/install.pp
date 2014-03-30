# == Class: pycharm::install
#
# Installs PyCharm.
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class pycharm::install {
  $edition = $pycharm::edition
  $version = $pycharm::version

  $source = $::osfamily ? {
    'Darwin' => "http://download-ln.jetbrains.com/python/pycharm-${edition}-${version}.dmg",
  }
  package {"pycharm-${edition}-${version}":
    ensure => installed,
    source => $source,
    provider => appdmg,
  }
}
