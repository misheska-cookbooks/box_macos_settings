module BoxMacosSettingsCookbook
  module MacosHostnameHelper
    def default_host_name
      host_name
    end

    def default_computer_name
      host_name
    end

    # ComputerName - the user-friendly name for the Mac that shows up on the
    # Mac itself and what is visible in the Sharing preference panel. It's
    # also what is visible to others when connecting to it over a local
    # network
    def current_computer_name
      @current_computer_name ||= begin
        # computer_name = shell_out('systemsetup -getcomputername')
        # computer_name.stdout.chomp.split('Computer Name: ')[1]
        computer_name = shell_out('scutil --get ComputerName')
        computer_name.stdout.chomp
      end
    end

    # HostName - name assigned to the computer that is visible from the
    # command line and also used by local and remote networks when connecting
    # through SSH and remote login
    def current_host_name
      @current_host_name ||= begin
        host_name = shell_out('scutil --get HostName')
        host_name.stdout.chomp
      end
    end

    # LocalHostName - name identifier used by Bonjour and
    # visible through file sharing services like AirDrop
    def current_local_host_name
      @local_host_name ||= begin
        host_name = shell_out('scutil --get LocalHostName')
        host_name.stdout.chomp
      end
    end
  end
end
