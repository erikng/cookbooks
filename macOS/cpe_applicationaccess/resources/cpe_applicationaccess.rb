#
# Cookbook Name:: cpe_applicationaccess
# Resource:: cpe_applicationaccess
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez
#

resource_name :cpe_applicationaccess
default_action :run

action :run do
  aa_prefs = node['cpe_applicationaccess'].reject { |_k, v| v.nil? }
  aan_prefs = node['cpe_applicationaccess.new'].reject { |_k, v| v.nil? }
  aa_prefs_list = {
    'allowAutoUnlock' => {},
    'allowCamera' => {},
    'allowCloudAddressBook' => {},
    'allowCloudBTMM' => {},
    'allowCloudDocumentSync' => {},
    'allowCloudFMM' => {},
    'allowCloudKeychainSync' => {},
    'allowCloudMail' => {},
    'allowCloudCalendar' => {},
    'allowCloudReminders' => {},
    'allowCloudBookmarks' => {},
    'allowCloudNotes' => {},
    'allowDefinitionLookup' => {},
    'allowMusicService' => {},
    'allowSpotlightInternetResults' => {}
  }
  aan_prefs_list = {
    'pathBlackList' => {},
    'pathWhiteList' => {},
    'whiteList' => {}
  }
  organization = node['organization'] ? node['organization'] : 'GitHub'
  prefix = node['cpe_profiles']['prefix']
  aa_profile = {
    'PayloadIdentifier' => "#{prefix}.applicationaccess",
    'PayloadRemovalDisallowed' => true,
    'PayloadScope' => 'System',
    'PayloadType' => 'Configuration',
    'PayloadUUID' => 'D1B78DD9-13A1-4BC5-9F22-EF10042F6041',
    'PayloadOrganization' => organization,
    'PayloadVersion' => 1,
    'PayloadDisplayName' => 'Application Restrictions',
    'PayloadContent' => []
  }
  unless aa_prefs.empty?
    aa_profile['PayloadContent'].push(
      'PayloadType' => 'com.apple.applicationaccess',
      'PayloadVersion' => 1,
      'PayloadIdentifier' => "#{prefix}.applicationaccess",
      'PayloadUUID' => '6493D033-179A-4E8D-AD85-FDBD09A28DCC',
      'PayloadEnabled' => true,
      'PayloadDisplayName' => 'Application Restrictions',
    )
  end
  unless aan_prefs.empty?
    aa_profile['PayloadContent'].push(
      'PayloadType' => 'com.apple.applicationaccess.new',
      'PayloadVersion' => 1,
      'PayloadIdentifier' => "#{prefix}.applicationaccess.new",
      'PayloadUUID' => '23E11571-624B-4B74-89C0-12226EEEACD1',
      'PayloadEnabled' => true,
      'PayloadDisplayName' => 'Application Restrictions New',
      'familyControlsEnabled' => true,
    )
  end

  aa_prefs_list = {
    'allowAutoUnlock' =>
      node['cpe_applicationaccess']['features']['allowAutoUnlock'],
    'allowCamera' =>
      node['cpe_applicationaccess']['features']['allowCamera'],
    'allowCloudAddressBook' =>
      node['cpe_applicationaccess']['features']['allowCloudAddressBook'],
    'allowCloudBTMM' =>
      node['cpe_applicationaccess']['features']['allowCloudBTMM'],
    'allowCloudDocumentSync' =>
      node['cpe_applicationaccess']['features']['allowCloudDocumentSync'],
    'allowCloudFMM' =>
      node['cpe_applicationaccess']['features']['allowCloudFMM'],
    'allowCloudKeychainSync' =>
      node['cpe_applicationaccess']['features']['allowCloudKeychainSync'],
    'allowCloudMail' =>
      node['cpe_applicationaccess']['features']['allowCloudMail'],
    'allowCloudCalendar' =>
      node['cpe_applicationaccess']['features']['allowCloudCalendar'],
    'allowCloudReminders' =>
      node['cpe_applicationaccess']['features']['allowCloudReminders'],
    'allowCloudBookmarks' =>
      node['cpe_applicationaccess']['features']['allowCloudBookmarks'],
    'allowCloudNotes' =>
      node['cpe_applicationaccess']['features']['allowCloudNotes'],
    'allowDefinitionLookup' =>
      node['cpe_applicationaccess']['features']['allowDefinitionLookup'],
    'allowMusicService' =>
      node['cpe_applicationaccess']['features']['allowMusicService'],
    'allowSpotlightInternetResults' =>
      node['cpe_applicationaccess']['features']['allowSpotlightInternetResults']
  }

  aan_prefs_list = {
    'pathBlackList' => node['cpe_applicationaccess']['lists']['pathBlackList'],
    'pathWhiteList' => node['cpe_applicationaccess']['lists']['pathWhiteList'],
    'whiteList' => node['cpe_applicationaccess']['lists']['WhiteList']
  }

  # Apply all settings to the profile
  aa_prefs_list.keys.each do |type|
    next if aa_prefs_list[type].nil?
    aa_profile['PayloadContent'][0]["#{type}"] = aa_prefs_list[type]
  end

  # Don't add applicationaccess.new settings unless attributes exist
  unless aan_prefs.empty?
    aan_prefs_list.keys.each do |type|
      next if aan_prefs_list[type].nil?
      # move the payload up one if no attributes exist for aa_prefs
      if aa_prefs.empty?
        aa_profile['PayloadContent'][0]["#{type}"] = aan_prefs_list[type]
      else
        aa_profile['PayloadContent'][1]["#{type}"] = aan_prefs_list[type]
      end
    end
  end

  node.default['cpe_profiles']["#{prefix}.applicationaccess"] = aa_profile
end
