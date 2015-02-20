class kibana4::params {

  $webserver_user            = 'www-data'
  $webserver_group           = 'www-data'

  $org_domain                = hiera('org_domain')

  $repo_scheme               = hiera('sp_repo_scheme')
  $repo_domain               = hiera('sp_repo_domain')
  $repo_port                 = hiera('sp_repo_port')
  $repo_user                 = hiera('sp_repo_user')
  $repo_pass                 = hiera('sp_repo_pass')
  $repo_path                 = hiera('sp_repo_path')
  $package                   = hiera('kibana_package')

  $elasticsearch_server      = 'localhost:9200'
  $kibana_document_root      = hiera('kibana_document_root')
  $kibana_htpasswd_file      = hiera('htpasswd_file')
  $kibana_htpasswd_user      = hiera('kibana_user')
  $kibana_htpasswd_pass      = hiera('kibana_pass')

  $bin_dir                   = 'bin'
  $config_dir                = 'config'
  $config_file               = "${config_dir}/kibana.yml"

  $elasticsearch_server_auth = false
  $elasticsearch_user        = hiera('kibana_user')
  $elasticsearch_user_pass   = hiera('kibana_pass')
}
