class kibana4::config {

  if ! defined (Apache2::Module['proxy']) {
    apache2::module { 'proxy':
      require => Class['roles::apache2_server']
    }
  }

  if ! defined (Apache2::Module['proxy_http']) {
    apache2::module { 'proxy_http':
      require => Class['roles::apache2_server']
    }
  }

  htpasswd::user {$kibana4::params::kibana_htpasswd_user:
    file     => $kibana4::params::kibana_htpasswd_file,
    password => $kibana4::params::kibana_htpasswd_pass,
  }

  apache2::site{'kibana4_vhost':
    source  => "${module_name}/web/apache2/kibana.vhost.conf.erb",
    require => Class['roles::apache2_server']
  }

  file{ 'kibana4_config':
    ensure  => present,
    path    => "${kibana4::params::kibana_document_root}/kibana/${kibana4::params::config_file}",
    content => template("${module_name}/${kibana4::params::config_file}${kibana4::config_version}.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file{ 'kibana4_init':
    path    => '/etc/init.d/kibana',
    content => template("${module_name}/init.d/kibana.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file{ 'kibana4_default':
    ensure  => present,
    path    => '/etc/default/kibana',
    content => template("${module_name}/default/kibana.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
}
