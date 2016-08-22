#
# Cookbook Name:: cpe_setupassistant
# Recipes:: default
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez

sa_prefs = {}

ruby_block 'sa_prefs' do
  block do
    sa_prefs = node['cpe_setupassistant'].reject { |_k, v| v.nil? }
    unless sa_prefs.empty?
      organization = node['organization'] ? node['organization'] : 'GitHub'
      prefix = node['cpe_profiles']['prefix']
      node.default['cpe_profiles']["#{prefix}.setupassistant"] = {
        'PayloadIdentifier' => "#{prefix}.setupassistant",
        'PayloadRemovalDisallowed' => true,
        'PayloadScope' => 'System',
        'PayloadType' => 'Configuration',
        'PayloadUUID' => '552E2A87-2B97-4626-AAE1-DF2113960074',
        'PayloadOrganization' => organization,
        'PayloadVersion' => 1,
        'PayloadDisplayName' => 'SetupAssistant',
        'PayloadContent' => [
          {
            'PayloadType' => 'com.apple.ManagedClient.preferences',
            'PayloadVersion' => 1,
            'PayloadIdentifier' => "#{prefix}.setupassistant",
            'PayloadUUID' => '4CB98425-1FA5-46FE-B68C-DCDA1C7A6960',
            'PayloadEnabled' => true,
            'PayloadDisplayName' => 'SetupAssistant',
            'PayloadContent' => {
              'com.apple.SetupAssistant' => {
                'Set-Once' => [
                  {
                    'mcx_preference_settings' => sa_prefs
                  }
                ]
              }
            }
          }
        ]
      }
    end
  end
  action :run
end
