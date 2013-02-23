# == Class: mco-rpmverify
#
# A quick and dirty mcollective plugin and puppet module to verify the sanity of files installed by rpm packages
#
# === Parameters
#
# === Variables
#
#
# === Examples
#
# class mco-rpmverify
#
# === Authors
#
# Wolf Noble <wolf@wolfspaw.com
#
# === Copyright
#
# Copyright 2013
#
class mco_rpmverify {
  #set some defaults
  File{
    ensure => 'file',
    group  => 'root',
    mode   => '0644',
    owner  => 'root',
    notify => Service['pe-mcollective'],
  }
  file {'/opt/puppet/libexec/mcollective/mcollective/agent/rpmverify.rb':
    source => "puppet:///modules/${module_name}/rpmverify.rb",
  }
  file {'/opt/puppet/libexec/mcollective/mcollective/application/rpmverify.rb':
    source => "puppet:///modules/${module_name}/rpmverify.rb",
  }
  if $::fact_is_puppetmaster {
    #only deploy the ddl if we're a puppetmaster
    file {'/opt/puppet/libexec/mcollective/mcollective/agent/rpmverify.ddl':
      source => "puppet:///modules/${module_name}/rpmverify.ddl",
    }
  }

}
