class plexms::url (
  $url          = $plexms::url,
  $file_type    = $plexms::file_type,
  $pkg_ensure   = $plexms::pkg_ensure,
  $repo_file    = $plexms::repo_file,
  $update_repo  = $plexms::update_repo,
  $pkg_provider = $plexms::pkg_provider,
  ) inherits plexms {
  $url_split = split($url, '/')
  $grep_file = grep($url_split, "$file_type")
  file { "$repo_file":
    ensure => absent,
  }
  exec { "$update_repo":
    refreshonly => true,
    subscribe   => File["$repo_file"],
    path        => ["/usr/bin", "/usr/sbin", "/bin", "/sbin"],
  }
  wget::fetch { "$url":
    destination => "/usr/local/src/$grep_file",
    timeout     => 0,
    verbose     => false,
  }->
  package { 'plexmediaserver':
    ensure   => $pkg_ensure, 
    provider => $pkg_provider,
    source   => "/usr/local/src/$grep_file",
  }
}
   
