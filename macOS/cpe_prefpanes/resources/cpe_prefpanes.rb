#
# Cookbook Name:: cpe_prefpanes
# Resources:: cpe_prefpanes
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez
#

resource_name :cpe_prefpanes
default_action :run

prefpanes_prefs = {}

action :run do
  prefpanes_prefs = node['cpe_prefpanes'].reject { nil? }
  unless prefpanes_prefs.empty?
    organization = node['organization'] ? node['organization'] : 'GitHub'
    prefix = node['cpe_profiles']['prefix']
    node.default['cpe_profiles']["#{prefix}.prefpanes"] = {
      'PayloadIdentifier' => "#{prefix}.prefpanes",
      'PayloadRemovalDisallowed' => true,
      'PayloadScope' => 'System',
      'PayloadType' => 'Configuration',
      'PayloadUUID' => '52592094-1C7F-4662-9921-9C53FB2754BD',
      'PayloadOrganization' => organization,
      'PayloadVersion' => 1,
      'PayloadDisplayName' => 'Preference Panes',
      'PayloadContent' => [
        {
          'PayloadType' => 'com.apple.systempreferences',
          'PayloadVersion' => 1,
          'PayloadIdentifier' => "#{prefix}.prefpanes",
          'PayloadUUID' => '77537A7B-76E2-4ED8-B559-A581002CFD3C',
          'PayloadEnabled' => true,
          'PayloadDisplayName' => 'Preference Panes',
          'DisabledPreferencePanes' => prefpanes_prefs
        }
      ]
    }
  end
end
