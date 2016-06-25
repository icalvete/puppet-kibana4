class kibana4 (

  $org_domain                = $kibana4::params::org_domain,
  $webserver_user            = $kibana4::params::webserver_user,
  $server_alias              = ['kibana'],
  $webserver_group           = $kibana4::params::webserver_group,
  $repo_scheme               = $kibana4::params::repo_scheme,
  $repo_domain               = $kibana4::params::repo_domain,
  $repo_port                 = $kibana4::params::repo_port,
  $repo_user                 = $kibana4::params::repo_user,
  $repo_pass                 = $kibana4::params::repo_pass,
  $repo_path                 = $kibana4::params::repo_path,
  $repo_resource             = $kibana4::params::package,
  $elasticsearch_server      = $kibana4::params::elasticsearch_server,
  $elasticsearch_server_auth = $kibana4::params::elasticsearch_server_auth,
  $elasticsearch_user        = $kibana4::params::elasticsearch_user,
  $elasticsearch_user_pass   = $kibana4::params::elasticsearch_user_pass,
  $config_version            = '4.4'

) inherits kibana4::params {

  if $server_alias {
    if ! is_array($server_alias) {
      fail('server_alias parameter must be un array')
    }
  }

  anchor {'kibana4::begin':
    before => Class['kibana4::install']
  }
  class {'kibana4::install':
    require => Anchor['kibana4::begin']
  }
  class {'kibana4::config':
    require => Class['kibana4::install']
  }
  class {'kibana4::service':
    require => Class['kibana4::config']
  }
  anchor {'kibana4::end':
    require => Class['kibana4::service']
  }
}
