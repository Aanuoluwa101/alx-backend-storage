exec { 'update':
  command  => 'sudo /usr/bin/apt-get update',
  provider => shell,
}

# install and start nginx
package { 'nginx':
  ensure  => installed,
  require => Exec['update'],
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

# Install Java 17 JDK
package { 'openjdk-17-jdk':
  ensure => 'installed',
}

# Install PostgreSQL and PostgreSQL contrib package
package { ['postgresql', 'postgresql-contrib']:
  ensure => 'installed',
}

# Download metabase.jar
file { '/home/ubuntu/metabase':
  ensure => 'directory',
}

exec { 'download metabase.jar':
  command => '/usr/bin/wget https://downloads.metabase.com/v0.45.2.1/metabase.jar -O /home/ubuntu/metabase/metabase.jar',
  provider => shell,
  creates => '/home/ubuntu/metabase/metabase.jar',
  require => File['/home/ubuntu/metabase'],
}

