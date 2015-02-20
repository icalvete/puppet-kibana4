class kibana4::service {

  service { 'kibana':
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
  }
}

