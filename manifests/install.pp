class kibana4::install {

  file {$kibana4::params::kibana_document_root:
    ensure => directory,
    owner  => $kibana4::webserver_user,
    group  => $kibana4::webserver_group,
    mode   => '0700'
  }

  common::down_resource {'kibana4_get_package':
    scheme   => $kibana4::repo_scheme,
    domain   => $kibana4::repo_domain,
    port     => $kibana4::repo_port,
    user     => $kibana4::repo_user,
    pass     => $kibana4::repo_pass,
    path     => $kibana4::repo_path,
    resource => $kibana4::repo_resource,
    require  => File[$kibana4::params::kibana_document_root]
  }

  exec {'kibana4_install_package':
    cwd     => $kibana4::params::kibana_document_root,
    command => "/bin/tar xfz /tmp/${kibana4::repo_resource}",
    require => Common::Down_resource['kibana4_get_package'],
    unless  => "/usr/bin/test -f ${kibana4::params::kibana_document_root}/kibana/config/kibana.yml"
  }

  exec {'kibana4_link_package':
    cwd      => $kibana4::params::kibana_document_root,
    command  => '/bin/ln -s kibana-4* kibana',
    provider => 'shell',
    require  => Exec['kibana4_install_package'],
    unless   => "/usr/bin/test -h ${kibana4::params::kibana_document_root}/kibana"
  }
}
