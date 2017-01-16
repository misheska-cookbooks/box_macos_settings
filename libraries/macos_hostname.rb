require_relative 'macos_hostname_helper'

module BoxMacosSettingsCookbook
  class MacosHostname < Chef::Resource
    resource_name :macos_hostname

    property :host_name, name_property: true
    property :local_host_name, String, default: lazy { default_host_name }
    property :computer_name, String, default: lazy { default_computer_name }

    load_current_value do
      # host_name invalid if nil or empty
      current_value_does_not_exist! if current_host_name.to_s == ''
      host_name current_host_name
      local_host_name current_local_host_name
      computer_name current_computer_name
    end

    action :set do
      converge_if_changed(:computer_name) do
        # shell_out!("systemsetup -setcomputername \"#{new_resource.computer_name}\"")
        shell_out!("scutil --set ComputerName \"#{new_resource.computer_name}\"")
      end
      converge_if_changed(:local_host_name) do
        shell_out!("scutil --set LocalHostName \"#{new_resource.local_host_name}\"")
      end
      converge_if_changed(:host_name) do
        shell_out!("scutil --set HostName \"#{new_resource.host_name}\"")
      end
    end

    include BoxMacosSettingsCookbook::MacosHostnameHelper
  end
end
