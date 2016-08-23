#
# Cookbook Name:: cpe_desktopwallpaper
# Recipes:: default
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez
#

dw_prefs = {}

ruby_block 'dw_prefs' do
  block do
    dw_prefs = node['cpe_desktopwallpaper'].reject { |_k, v| v.nil? }
    unless dw_prefs.empty?
      organization = node['organization'] ? node['organization'] : 'GitHub'
      prefix = node['cpe_profiles']['prefix']
      node.default['cpe_profiles']["#{prefix}.desktopwallpaper"] = {
        'PayloadIdentifier' => "#{prefix}.desktopwallpaper",
        'PayloadRemovalDisallowed' => true,
        'PayloadScope' => 'System',
        'PayloadType' => 'Configuration',
        'PayloadUUID' => 'CEC5E19F-AEEC-45BF-96EE-CCC0FAC66157',
        'PayloadOrganization' => organization,
        'PayloadVersion' => 1,
        'PayloadDisplayName' => 'Desktop Wallpaper',
        'PayloadContent' => [
          {
            'PayloadType' => 'com.apple.desktop',
            'PayloadVersion' => 1,
            'PayloadIdentifier' => "#{prefix}.desktopwallpaper",
            'PayloadUUID' => '13CC19FC-5E0F-49E7-8F71-20D28C23AAF4',
            'PayloadEnabled' => true,
            'PayloadDisplayName' => 'Desktop Wallpaper',
            'locked' => true,
            'override-picture-path' =>
              node['cpe_desktopwallpaper']['OveridePicturePath']
          }
        ]
      }
    end
  end
  action :run
end
