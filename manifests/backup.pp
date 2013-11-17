class plexms::backup (
  $backup   = $plexms::backup,
  $storage  = $plexms::storage,
  $filename = $plexms::filename,
  $library  = $plexms::library,
  $minute   = $plexms::minute,
  $hour     = $plexms::hour,
  ) inherits plexms {
  if ($backup == true) {
    $cron_ensure = 'present'
    exec { 'storage_dir':
      command => "/bin/mkdir -p $storage",
      creates => "$storage",
    }
    file { "$storage":
      ensure => $storage_ensure,
      owner  => '0',
      group  => '0',
      mode   => '0755',
      require => Exec['storage_dir'],
    }
  } else {
    $cron_ensure = 'absent'
  }
  tps::report { '/usr/local/bin/plex_backup':
    mode  => '0755',
    flare => [
      '#!/bin/bash',
      "/bin/tar -czf $storage/$filename.tar.gz $library",
      'exit',
    ],
  }
  cron { 'plex_backup':
    ensure => $cron_ensure,
    command => '/usr/local/bin/plex_backup 2>&1',
    user    => '0',
    hour    => "$hour",
    minute  => "$minute",
  }
}
