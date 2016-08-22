cpe_prefpanes Cookbook
=========================
Install a profile to disable System Preference Panes.

Requirements:
[cpe_profiles](https://github.com/facebook/IT-CPE/tree/master/chef/cookbooks/cpe_profiles)
------------
Mac OS X

Attributes
----------
* node['cpe_prefpanes']

Usage
-----
The profile will manage the `com.apple.systempreferences` preference domain. 

The profile's organization key defaults to `GitHub` unless `node['organization']` is
configured in your company's custom init recipe. The profile will also use
whichever prefix is set in node['cpe_profiles']['prefix'], which defaults to `com.facebook.chef`

The default `node['cpe_prefpanes']` is nil, so that no profile is installed by default.

The most common use case is for service machines that will be significantly locked down.

    # Disable iCloud, Internet Accounts and Profiles in System Preferences.
    node.default['cpe_prefpanes'] = [
      'com.apple.preferences.icloud',
      'com.apple.preferences.internetaccounts',
      'com.apple.preferences.configurationprofiles'
    ]
