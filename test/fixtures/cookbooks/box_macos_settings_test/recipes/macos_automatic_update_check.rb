#
# Cookbook:: box_macos_settings
# Recipe:: macos_automatic_update_check
#

macos_automatic_update_check 'non-default' do
  setting 'enable'
  action :set
end
