class plexms::params {
  $backup   = true
  $storage  = '/backup'
  $filename = "plex_library.`date '+%A'`"
  $library  = '/var/lib/plexmediaserver'
  $minute   = '30'
  $hour     = '4'
  $pkg_req  = $operatingsystem ? {
    'Ubuntu' => File['/etc/apt/sources.list.d/plex.list'],
    default  => Yumrepo['PlexRepo'],
  }
  $pkg_ensure = 'latest'
  $svc_ensure = 'running'
}
