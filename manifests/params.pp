class kibana4::params {

  $webserver_user            = 'www-data'
  $webserver_group           = 'www-data'

  $org_domain                = pick(hiera('org_domain'), 'example.net')

  $repo_scheme               = pick(hiera('sp_repo_scheme'), 'http')
  $repo_domain               = pick(hiera('sp_repo_domain'), 'smarpurposes-repo.s3-website-eu-west-1.amazonaws.com')
  $repo_port                 = pick_default(hiera('sp_repo_port'), '')
  $repo_user                 = pick_default(hiera('sp_repo_user'), '')
  $repo_pass                 = pick_default(hiera('sp_repo_pass'), '')
  $repo_path                 = pick_default(hiera('sp_repo_path'), '')
  $package                   = pick(hiera('kibana_package'), 'kibana-4.5.1-linux-x64.tar.gz')

  $elasticsearch_server      = 'localhost:9200'
  $kibana_document_root      = pick(hiera('kibana_document_root'), '/srv/kibana')
  $kibana_htpasswd_file      = pick(hiera('htpasswd_file'), '/etc/apache2/htpasswd')
  $kibana_htpasswd_user      = pick(hiera('kibana_user'), 'kibana')
  $kibana_htpasswd_pass      = pick(hiera('kibana_pass'), 'kibana')

  $bin_dir                   = 'bin'
  $bin_file                  = "${bin_dir}/kibana"
  $config_dir                = 'config'
  $config_file               = "${config_dir}/kibana.yml"

  $elasticsearch_server_auth = false
  $elasticsearch_user        = pick(hiera('kibana_user'), 'kibana')
  $elasticsearch_user_pass   = pick(hiera('kibana_user'), 'kibana')
}
