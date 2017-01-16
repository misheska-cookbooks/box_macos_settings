#
# Cookbook:: box_macos_settings
# Recipe:: default
#
# Copyright:: 2017, Mischa Taylor
# Licensed under the Apache License, Version 2.0

macos_automatic_update_check 'disable'
macos_remote_login 'enable'
macos_screen_sharing 'enable'
