cpe_applicationaccess Cookbook
=========================
Install a profile to manage various application settings.

Requirements
------------
Mac OS X

Attributes
----------
* node['cpe_applicationaccess']
* node['cpe_applicationaccess']['lists']['pathBlackList']
* node['cpe_applicationaccess']['lists']['pathWhiteList']
* node['cpe_applicationaccess']['lists']['whiteList']
* node['cpe_applicationaccess']['features']['allowAutoUnlock']
* node['cpe_applicationaccess']['features']['allowCamera']
* node['cpe_applicationaccess']['features']['allowCloudAddressBook']
* node['cpe_applicationaccess']['features']['allowCloudBTMM']
* node['cpe_applicationaccess']['features']['allowCloudDocumentSync']
* node['cpe_applicationaccess']['features']['allowCloudFMM']
* node['cpe_applicationaccess']['features']['allowCloudKeychainSync']
* node['cpe_applicationaccess']['features']['allowCloudMail']
* node['cpe_applicationaccess']['features']['allowCloudCalendar']
* node['cpe_applicationaccess']['features']['allowCloudReminders']
* node['cpe_applicationaccess']['features']['allowCloudBookmarks']
* node['cpe_applicationaccess']['features']['allowCloudNotes']
* node['cpe_applicationaccess']['features']['allowDefinitionLookup']
* node['cpe_applicationaccess']['features']['allowMusicService']
* node['cpe_applicationaccess']['features']['allowSpotlightInternetResults']

Usage
-----
The profile will manage the `com.apple.applicationaccess` and `com.apple.applicationaccess.new` preference domains.

The profile's organization key defaults to `GitHub` unless `* node['organization']` is
configured in your company's custom init recipe. The profile will also use
whichever prefix is set in * node['cpe_profiles']['prefix'], which defaults to `com.facebook.chef`

The profile delivers a payload of all keys in `* node['cpe_applicationaccess']` and/or `* node['cpe_applicationaccess.new']` that are non-nil values.  All provided keys are nil, so that no profile is installed by default.


The most common use case for `com.apple.applicationaccess.new` is for service machines that will be significantly locked down.

    # Allow anything from "/".
    * node.* node['cpe_applicationaccess']['pathWhiteList' = [
      '/'
    ]
    # Block paths.
    * node.* node['cpe_applicationaccess']['pathBlackList' = [
      '/Applications/AutoPkgr.app',
      '/Applications/Transmission.app'
    ]

The most common use case for `com.apple.applicationaccess` is to lock down specific internet features.
