module BoxMacosSettingsCookbook
  module BoxMacosAutomaticUpdateCheckHelper
    def current_automatic_update_check
      @current_automatic_update_check ||= begin
        defaults_read = shell_out(
          'defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled'
        )
        return nil unless defaults_read.exitstatus.zero?
        defaults_read.stdout.include?('1') ? true : false
      end
    end

    def automatic_update_check_command
      case setting
      when 'enable'
        'defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool TRUE'
      else
        'defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool FALSE'
      end
    end

    def automatic_update_check_changed?
      return true if current_automatic_update_check.nil?
      case setting
      when 'enable'
        return false if current_automatic_update_check == true
      when 'disable'
        return false if current_automatic_update_check == false
      end
      true
    end
  end
end
