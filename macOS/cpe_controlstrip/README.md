cpe_controlstrip Cookbook
=========================
Install a profile to manage the TouchBar top-right shortcuts.

Requirements:
[cpe_profiles](https://github.com/facebook/IT-CPE/tree/master/chef/cookbooks/cpe_profiles)
------------
macOS Sierra 10.12.1 or higher on TouchBar MacBook Pros

Attributes
----------
* node['cpe_controlstrip']
* node['cpe_controlstrip']['MiniCustomized']

Usage
-----
The profile will manage the `com.apple.controlstrip` preference domain.

The profile's organization key defaults to `GitHub` unless `node['organization']` is
configured in your company's custom init recipe. The profile will also use
whichever prefix is set in node['cpe_profiles']['prefix'], which defaults to `com.facebook.chef`

The profile delivers a payload of all keys in `node['cpe_controlstrip']` that are non-nil values.  The provided key `node['cpe_controlstrip']['MiniCustomized']` is nil, so that no profile is installed by default.

The most common use case is for touch bar client machines that you want the lock screen to be configured. You can also use node attributes to dynamically update these fields without writing new code:

Note: You *must* deploy four strings in the array for it to properly apply.

The following keys are currently available as of 11/28/2016
* com.apple.system.brightness
* com.apple.system.dashboard
* com.apple.system.dictation
* com.apple.system.do-not-disturb
* com.apple.system.input-menu
* com.apple.system.launchpad
* com.apple.system.media-play-pause
* com.apple.system.mission-control
* com.apple.system.mute
* com.apple.system.notification-center
* com.apple.system.screen-lock
* com.apple.system.screen-saver
* com.apple.system.screencapture
* com.apple.system.search
* com.apple.system.show-desktop
* com.apple.system.siri
* com.apple.system.sleep
* com.apple.system.volume

```
# Configure MiniBar for DND, Play/Pause, Sleep, & Screen Lock
node.default['cpe_controlstrip']['MiniCustomized'] => [
  'com.apple.system.do-not-disturb',
  'com.apple.system.media-play-pause',
  'com.apple.system.sleep',
  'com.apple.system.screen-lock'
]
```
