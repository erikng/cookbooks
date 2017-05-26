#
# Cookbook Name:: cpe_softwareupdate
# Attributes:: cpe_softwareupdate
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez

default['cpe_softwareupdate'] = {
  # Commerce
  'commerce' => {
    'AutoUpdate' => nil,
    'AutoUpdateRestartRequired' => nil,
  },
  # SoftwareUpdate
  'su' => {
    'AllowPreReleaseInstallation' => nil,
    'CatalogURL' => nil,
  },
}
