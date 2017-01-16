#
# Cookbook:: box_macos_settings
# Recipe:: non_default
#

macos_automatic_update_check 'enable'
# Can't test disabling of remote login as InSpec needs it enabled
# macos_remote_login 'disable'
macos_screen_sharing 'disable'
