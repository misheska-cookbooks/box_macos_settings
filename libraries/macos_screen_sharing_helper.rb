module BoxMacosSettingsCookbook
  module BoxMacosScreenSharingHelper
    def current_remote_management
      @current_remote_management ||= begin
        ::File.file?('/etc/RemoteManagement.launchd')
      end
    end

    def current_screen_sharing
      @current_screen_sharing ||= begin
        screensharing = shell_out('launchctl list com.apple.screensharing')
        screensharing.exitstatus.zero?
      end
    end

    def screen_sharing_changed?
      case setting
      when 'enable'
        return false if current_screen_sharing == true
      when 'disable'
        return false if current_screen_sharing == false
      end
      true
    end
  end
end
