#
# Cookbook Name:: cpe_applicationaccess
# Recipes:: default
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Written by Erik Gomez
# Modified by Nick McSpadden
#

default['cpe_applicationaccess'] = {
  # Path Application Whitelist/Blacklist
  'lists' => {
    'pathBlackList' => nil,
    'pathWhiteList' => nil,
    'whiteList' => nil
  },
  # Application Access Features
  'features' => {
    'allowAutoUnlock' => nil,
    'allowCamera' => nil,
    'allowCloudAddressBook' => nil,
    'allowCloudBTMM' => nil,
    'allowCloudDocumentSync' => nil,
    'allowCloudFMM' => nil,
    'allowCloudKeychainSync' => nil,
    'allowCloudMail' => nil,
    'allowCloudCalendar' => nil,
    'allowCloudReminders' => nil,
    'allowCloudBookmarks' => nil,
    'allowCloudNotes' => nil,
    'allowDefinitionLookup' => nil,
    'allowMusicService' => nil,
    'allowSpotlightInternetResults' => nil
  }
}
