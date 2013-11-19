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
  $url        = $plexms::params::url,
  $file_type  = $plexms::params::file_type,
  $repo_file  = $plexms::params::repo_file,
  $pkg_provider = $plexms::params::pkg_provider,
  ) inherits plexms::params {
  if ($url == 'UNSET') {
    class { 'plexms::repos':}
  } else {
    class {'plexms::url':}
  }
  class { 'plexms::backup':}
  service { 'plexmediaserver':
    ensure    => $svc_ensure,
    enable    => true,
    subscribe => Package['plexmediaserver'],
    require   => Package['plexmediaserver'],
  }
}
