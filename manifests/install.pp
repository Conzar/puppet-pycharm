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

  if $::osfamily == 'Darwin' {
    $filename = "pycharm-${edition}-${version}.dmg"
    $source = "http://download-ln.jetbrains.com/python/${filename}"
    package {"pycharm-${edition}-${version}":
      ensure   => installed,
      source   => $source,
      provider => appdmg,
    }

  }elsif $::osfamily == 'Debian' {

    $filename  = "pycharm-${edition}-${version}.tar.gz"
    $source    =  "https://download.jetbrains.com/python/${filename}"
    $root      = '/opt/pycharm'
    $downloads = "${root}/download"

    ensure_packages('wget')

    file{[$root,$downloads]:
      ensure => directory,
    }

    archive { 'unpack_pycharm':
      path         => "${downloads}/${filename}",
      source       => $source,
      extract      => true,
      extract_path => $root,
      #creates      => "${homedir}/help" #directory inside tgz
      require      => [Package['wget'],File[$root,$downloads]],
    }
  }
}
