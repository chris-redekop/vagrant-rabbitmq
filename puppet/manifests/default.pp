apt::source { 'apt-source':
  location => 'http://www.rabbitmq.com/debian/',
  release => 'testing',
  repos => 'main',
  include_src => false,
  key        => 'F7B8CEA6056E8E56',
  key_source => 'http://www.rabbitmq.com/rabbitmq-signing-key-public.asc',
}

class { '::rabbitmq':
  config => 'prov/rabbitmq.config.erb',
  require => Apt::Source['apt-source']
}

rabbitmq_user { $username:
  password => $username,
  admin => true
}

rabbitmq_vhost { $username:
  ensure => present,
}

rabbitmq_user_permissions { "${username}@${username}":
  configure_permission => '.*',
  read_permission      => '.*',
  write_permission     => '.*',
}

rabbitmq_plugin {'rabbitmq_shovel':
  ensure => present,
}

rabbitmq_plugin {'rabbitmq_shovel_management':
  ensure => present,
}

package {'python-pip':
}

package {'git-core':
}

python::pip {'pika':
  ensure => '0.9.8',
  require => [ Package['python-pip'], Package['git-core'] ]
}

file { '/home/vagrant/send.py':
  group => 'vagrant',
  mode => '0755',
  owner => 'vagrant',
  source => 'puppet:///modules/prov/send.py'
}

file { '/home/vagrant/receive.py':
  group => 'vagrant',
  mode => '0755',
  owner => 'vagrant',
  source => 'puppet:///modules/prov/receive.py'
}
