#
# Cookbook Name:: cpe_softwareupdate
# Resources:: cpe_softwareupdate
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez

resource_name :cpe_softwareupdate
default_action :run

# Enforce SoftwareUpdate settings
action :run do
  susu_prefs = node['cpe_softwareupdate']['su'].reject { |_k, v| v.nil? }
  suc_prefs = node['cpe_softwareupdate']['commerce'].reject { |_k, v| v.nil? }
  if susu_prefs.empty? && suc_prefs.empty?
    Chef::Log.info("#{cookbook_name}: No prefs found.")
    return
  end

  organization = node['organization'] ? node['organization'] : 'GitHub'
  prefix = node['cpe_profiles']['prefix']
  su_profile = {
    'PayloadIdentifier' => "#{prefix}.softwareupdate",
    'PayloadRemovalDisallowed' => true,
    'PayloadScope' => 'System',
    'PayloadType' => 'Configuration',
    'PayloadUUID' => '723E303B-DB32-4D9D-BDF3-414FDEAE4C05',
    'PayloadOrganization' => organization,
    'PayloadVersion' => 1,
    'PayloadDisplayName' => 'SoftwareUpdate',
    'PayloadContent' => [],
  }
  unless susu_prefs.empty?
    su_profile['PayloadContent'].push(
      'PayloadType' => 'com.apple.SoftwareUpdate',
      'PayloadVersion' => 1,
      'PayloadIdentifier' => "#{prefix}.softwareupdate",
      'PayloadUUID' => '696C54DC-BB3F-49CC-B1D4-A99D7B932480',
      'PayloadEnabled' => true,
      'PayloadDisplayName' => 'SoftwareUpdate (SoftwareUpdate)',
    )

    susu_prefs.keys.each do |key|
      next if susu_prefs[key].nil?
      su_profile['PayloadContent'][0][key] = susu_prefs[key]
    end
  end

  unless suc_prefs.empty?
    su_profile['PayloadContent'].push(
      'PayloadType' => 'com.apple.commerce',
      'PayloadVersion' => 1,
      'PayloadIdentifier' => "#{prefix}.commerce",
      'PayloadUUID' => 'CEB62119-3F48-472F-8B5F-C17177DAAD97',
      'PayloadEnabled' => true,
      'PayloadDisplayName' => 'SoftwareUpdate (Commerce)',
      'familyControlsEnabled' => true,
    )

    suc_prefs.keys.each do |key|
      next if suc_prefs[key].nil?
      su_profile['PayloadContent'][-1][key] = suc_prefs[key]
    end
  end

  node.default['cpe_profiles']["#{prefix}.softwareupdate"] = su_profile
end
