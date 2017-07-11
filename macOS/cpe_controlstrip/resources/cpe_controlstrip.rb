#
# Cookbook Name:: cpe_controlstrip
# Resource:: cpe_controlstrip
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez
#

resource_name :cpe_controlstrip
default_action :run

action :run do
  cs_prefs = node['cpe_controlstrip'].reject { |_k, v| v.nil? }
  if cs_prefs.empty?
    Chef::Log.info("#{cookbook_name}: No prefs found.")
    return
  end

  organization = node['organization'] ? node['organization'] : 'GitHub'
  prefix = node['cpe_profiles']['prefix']
  cs_profile = {
    'PayloadIdentifier' => "#{prefix}.controlstrip",
    'PayloadRemovalDisallowed' => true,
    'PayloadScope' => 'System',
    'PayloadType' => 'Configuration',
    'PayloadUUID' => 'A6183E3F-E66A-4E51-892D-C7CD01F30EA1',
    'PayloadOrganization' => organization,
    'PayloadVersion' => 1,
    'PayloadDisplayName' => 'ControlStrip Configuration',
    'PayloadContent' => [],
  }
  unless cs_prefs.empty?
    cs_profile['PayloadContent'].push(
      'PayloadType' => 'com.apple.controlstrip',
      'PayloadVersion' => 1,
      'PayloadIdentifier' => "#{prefix}.controlstrip",
      'PayloadUUID' => '0B824E7D-2B97-473C-AE6B-73F8039E505F',
      'PayloadEnabled' => true,
      'PayloadDisplayName' => 'ControlStrip Configuration',
    )

    cs_prefs.keys.each do |key|
      next if cs_prefs[key].nil?
      cs_profile['PayloadContent'][0][key] = cs_prefs[key]
    end
  end

  node.default['cpe_profiles']["#{prefix}.controlstrip"] = cs_profile
end
