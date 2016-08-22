#
# Cookbook Name:: cpe_setupassistant
# Attributes:: default
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez

# Disable Setup Assistant
default['cpe_setupassistant']['DidSeeCloudSetup'] = nil
default['cpe_setupassistant']['LastSeenBuddyBuildVersion'] = nil
default['cpe_setupassistant']['LastSeenCloudProductVersion'] = nil
default['cpe_setupassistant']['RunNonInteractive'] = nil
