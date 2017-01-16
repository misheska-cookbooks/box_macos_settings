require_relative 'macos_remote_login_helper'

module BoxMacosSettingsCookbook
  class MacosRemoteLogin < Chef::Resource
    resource_name :macos_remote_login

    property :setting, equal_to: %w(disable enable), name_property: true

    action :set do
      return unless remote_login_changed?
      execute "#{new_resource.setting} remote login" do
        command remote_login_command
        only_if { remote_login_changed? }
      end
    end

    include BoxMacosSettingsCookbook::BoxMacosRemoteLoginHelper
  end
end
