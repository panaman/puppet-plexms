class plexms::repos (
  $pkg_ensure = $plexms::pkg_ensure,
  ) inherits plexms {
  package { 'plexmediaserver':
    ensure  => $pkg_ensure,
  }
  case $operatingsystem {
    'RedHat','Fedora','CentOS','Scientific': {
      yumrepo { 'PlexRepo':
        baseurl  => 'http://plex.r.worldssl.net/PlexMediaServer/fedora-repo/release/$basearch/',
        enabled  => '1',
        gpgcheck => '1',
        gpgkey   => 'http://plexapp.com/plex_pub_key.pub',
        descr    => 'PlexRepo',
        before   => Package['plexmediaserver'],
      }
    }
    'Debian','Ubuntu': {
      apt::key { 'plex':
        key        => 'E533491A',
        key_source => 'http://plexapp.com/plex_pub_key.pub',
      } ->
      apt::source { 'plex':
        location    => 'http://plex.r.worldssl.net/PlexMediaServer/ubuntu-repo',
        release     => 'lucid',
        include_src => false,
        before      => Package['plexmediaserver'],
      }
    }
  }
}
