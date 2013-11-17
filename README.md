Plex Media Server
-----------------
This module will install the Plex media server and create a backup cron of the PMS Library.
This module works on Ubuntu, Centos, Redhat, Fedora and Scientific.

###Plex Media Server Control Panel
http://hostname:32400/manage

### Basic Usage
Accept all defaults, and store backups in /backup/plex_libaray.date.tar.gz

```
  include plexms
```
###Install Plex and disable backups
```
  class { 'plexms':
    backup => false,
  }
```
###Variables
```
  $backup   = true # Enable Backup (default)
            = false # Disable Backup
  $storage  = '/backup' # Backup storage directory
  $filename = "plex_library.`date '+%A'`" # Backup file name
  $minute   = '30' # Cron Backup minute
  $hour     = '4' # Cron Backup hour
```

Support
-------
Please log tickets and issues at our [Projects site](https://github.com/panaman/puppet-plexms/issues)
