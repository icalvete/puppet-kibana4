define kibana4::plugin (

  $ensure      = present,
  $plugin_name = $name,
  $version     = 'latest',
  $org         = 'elasticsearch'

) {

  include kibana4

  validate_re($ensure, '^present|absent$', '$ensure must be present or absent')

  if $ensure == 'present' {

    validate_re($version, '^[0-9\.]*$|latest', '$version can\'t be undef and must be like [0-9\.]*|latest')

    $plugin_operation = "--install ${org}/${plugin_name}/${version}"
    $unless_plugin_operation = "| grep ${plugin_name}"

  } else {

    $plugin_operation = "--remove ${$plugin_name}"
    $unless_plugin_operation = "| grep -v ${plugin_name}"

  }

  exec {"kibana4_install_plugin_${plugin_name}":
    cwd     => $kibana4::params::kibana_document_root,
    command => "${kibana4::params::kibana_document_root}/kibana/${kibana4::params::bin_file} plugin ${plugin_operation}",
    unless  => "${kibana4::params::kibana_document_root}/kibana/${kibana4::params::bin_file} plugin --list | ${unless_plugin_operation}",
    notify  => Class['kibana4::service']
  }
}
