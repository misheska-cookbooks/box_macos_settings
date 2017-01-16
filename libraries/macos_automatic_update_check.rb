require_relative 'macos_automatic_update_check_helper'

module BoxMacosSettingsCookbook
  class MacosAutomaticUpdateCheck < Chef::Resource
    resource_name :macos_automatic_update_check

    property :setting, equal_to: %w(disable enable), name_property: true

    action :set do
      return unless automatic_update_check_changed?
      execute "#{new_resource.setting} automatic update check" do
        command automatic_update_check_command
        user 'root'
        only_if { automatic_update_check_changed? }
      end
    end

    include BoxMacosSettingsCookbook::BoxMacosAutomaticUpdateCheckHelper
  end
end
