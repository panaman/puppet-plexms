class plexms::repos {
  case $operatingsystem {
    'RedHat','Fedora','CentOS','Scientific': {
      yumrepo { 'PlexRepo':
        baseurl  => 'http://plex.r.worldssl.net/PlexMediaServer/fedora-repo/release/$basearch/',
        enabled  => '1',
        gpgcheck => '1',
        gpgkey   => 'http://plexapp.com/plex_pub_key.pub',
        descr    => 'PlexRepo',
      }
    }
    'Ubuntu': {
      tps::report { '/etc/apt/sources.list.d/plex.list':
        flare => 'deb http://plex.r.worldssl.net/PlexMediaServer/ubuntu-repo lucid main',
      }
      apt::key { 'plex':
        key        => 'E533491A',
        key_source => 'http://plexapp.com/plex_pub_key.pub',
        require    => File['/etc/apt/sources.list.d/plex.list'],
        before     => Package['plexmediaserver'],
      }
    }
  }
}
