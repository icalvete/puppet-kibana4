#puppet-kibana3

Puppet manifest to install and configure kibana 4

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-kibana4.png)](http://travis-ci.org/icalvete/puppet-kibana4)

##Actions:

Install and configure [kibana4](https://github.com/elasticsearch/kibana/)

##Requires:

* Only works on Ubuntu
* [hiera](http://docs.puppetlabs.com/hiera/1/index.html)
* common::down_resource from https://github.com/icalvete/puppet-common
* htpasswd::user from https://github.com/icalvete/puppet-htpasswd
* apache2::site, apache2::alias and apache2::auth_basic from https://github.com/icalvete/puppet-apache2

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
