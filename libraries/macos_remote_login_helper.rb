module BoxMacosSettingsCookbook
  module BoxMacosRemoteLoginHelper
    def current_remote_login
      @current_remote_login ||= begin
        remote_login = shell_out('systemsetup -getremotelogin')
        remote_login.stdout.include?('Remote Login: On') ? true : false
      end
    end

    def remote_login_changed?
      case setting
      when 'enable'
        return false if current_remote_login == true
      when 'disable'
        return false if current_remote_login == false
      end
      true
    end

    def remote_login_command
      case setting
      when 'enable'
        'systemsetup -f -setremotelogin on'
      else
        'systemsetup -f -setremotelogin off'
      end
    end
  end
end
