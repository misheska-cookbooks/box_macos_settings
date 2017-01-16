require_relative 'macos_screen_sharing_helper'

module BoxMacosSettingsCookbook
  class MacosScreenSharing < Chef::Resource
    resource_name :macos_screen_sharing

    property :setting, equal_to: %w(disable enable), name_property: true

    action :set do
      return unless screen_sharing_changed?
      case new_resource.setting
      when 'enable'
        execute "#{new_resource.setting} screen sharing" do
          command 'launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist'
          only_if { screen_sharing_changed? }
        end
     else
        execute "#{new_resource.setting} screen sharing" do
          command 'launchctl unload -w /System/Library/LaunchDaemons/com.apple.screensharing.plist'
          only_if { screen_sharing_changed? }
        end
     end
    end

    include BoxMacosSettingsCookbook::BoxMacosScreenSharingHelper
  end
end
