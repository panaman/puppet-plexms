class plexms (
  $backup     = $plexms::params::backup,
  $storage    = $plexms::params::storage,
  $filename   = $plexms::params::filename,
  $library    = $plexms::params::library,
  $minute     = $plexms::params::minute,
  $hour       = $plexms::params::hour,
  $pkg_req    = $plexms::params::pkg_req,
  $pkg_ensure = $plexms::params::pkg_ensure,
  $svc_ensure = $plexms::params::svc_ensure,
  ) inherits plexms::params {
  class { 'plexms::repos':}
  class { 'plexms::backup':}
  package { 'plexmediaserver':
    ensure  => $pkg_ensure,
    require => $pkg_req,
  }
  service { 'plexmediaserver':
    ensure    => $svc_ensure,
    enable    => true,
    subscribe => Package['plexmediaserver'],
    require   => Package['plexmediaserver'],
  }
}
