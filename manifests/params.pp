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
  $url        = 'UNSET'
  $file_type = $osfamily ? {
    'Debian' => '.deb',
    default  => '.rpm',
  }
  $repo_file = $osfamily ? {
    'Debian' => '/etc/apt/sources.list.d/plex.list',
    default  => '/etc/yum.repos.d/PlexRepo.repo',
  }
  $update_repo = $osfamily ? {
    'Debian' => 'apt-get update',
    default  => 'yum clean all',
  }
  $pkg_provider = $osfamily ? {
    'Debian' => 'dpkg',
    default  => 'rpm',
  }
}
