#
# Cookbook Name:: cpe_applicationaccess
# Recipes:: default
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez
#

# Path Application Whitelist/Blacklist
default['cpe_applicationaccess.new']['pathBlackList'] = nil
default['cpe_applicationaccess.new']['pathWhiteList'] = nil
default['cpe_applicationaccess.new']['whiteList'] = nil

# Application Access Features
default['cpe_applicationaccess']['allowAutoUnlock'] = nil
default['cpe_applicationaccess']['allowCamera'] = nil
default['cpe_applicationaccess']['allowCloudAddressBook'] = nil
default['cpe_applicationaccess']['allowCloudBTMM'] = nil
default['cpe_applicationaccess']['allowCloudDocumentSync'] = nil
default['cpe_applicationaccess']['allowCloudFMM'] = nil
default['cpe_applicationaccess']['allowCloudKeychainSync'] = nil
default['cpe_applicationaccess']['allowCloudMail'] = nil
default['cpe_applicationaccess']['allowCloudCalendar'] = nil
default['cpe_applicationaccess']['allowCloudReminders'] = nil
default['cpe_applicationaccess']['allowCloudBookmarks'] = nil
default['cpe_applicationaccess']['allowCloudNotes'] = nil
default['cpe_applicationaccess']['allowDefinitionLookup'] = nil
default['cpe_applicationaccess']['allowMusicService'] = nil
default['cpe_applicationaccess']['allowSpotlightInternetResults'] = nil
