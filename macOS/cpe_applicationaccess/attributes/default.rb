#
# Cookbook Name:: cpe_applicationaccess
# Recipes:: default
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez
#

# Path Application Whitelist/Blacklist
default['cpe_applicationaccess']['lists']['pathBlackList'] = nil
default['cpe_applicationaccess']['lists']['pathWhiteList'] = nil
default['cpe_applicationaccess']['lists']['whiteList'] = nil

# Application Access Features
default['cpe_applicationaccess']['features']['allowAutoUnlock'] = nil
default['cpe_applicationaccess']['features']['allowCamera'] = nil
default['cpe_applicationaccess']['features']['allowCloudAddressBook'] = nil
default['cpe_applicationaccess']['features']['allowCloudBTMM'] = nil
default['cpe_applicationaccess']['features']['allowCloudDocumentSync'] = nil
default['cpe_applicationaccess']['features']['allowCloudFMM'] = nil
default['cpe_applicationaccess']['features']['allowCloudKeychainSync'] = nil
default['cpe_applicationaccess']['features']['allowCloudMail'] = nil
default['cpe_applicationaccess']['features']['allowCloudCalendar'] = nil
default['cpe_applicationaccess']['features']['allowCloudReminders'] = nil
default['cpe_applicationaccess']['features']['allowCloudBookmarks'] = nil
default['cpe_applicationaccess']['features']['allowCloudNotes'] = nil
default['cpe_applicationaccess']['features']['allowDefinitionLookup'] = nil
default['cpe_applicationaccess']['features']['allowMusicService'] = nil
default['cpe_applicationaccess']['features']['allowSpotlightInternetResults'] = nil
