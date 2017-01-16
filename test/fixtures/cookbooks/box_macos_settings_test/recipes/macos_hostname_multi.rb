#
# Cookbook:: box_macos_settings
# Recipe:: macos_hostname_multi
#

macos_hostname 'multi' do
  host_name 'misheska'
  local_host_name 'MacBook'
  computer_name "Mischa's MacBook"
end
