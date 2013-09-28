# == Class: pycharm
#
# Installs PyCharm
#
# === Parameters:
#
# [*edition*] Edition of PyCharm. Valid values are 'community' or 'professional'. Defaults to 'community'.
# [*version*] Version of PyCharm
#
# === Examples
#
#  class { pycharm:
#	 language => 'professional',
#    version => '3.0',
#  }
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class pycharm (
  $edition = $pycharm::params::edition,
  $version = $pycharm::params::version
) inherits pycharm::params {
  anchor {'pycharm::begin': } ->
  class {'pycharm::install': } ->
  anchor {'pycharm::end': }
}