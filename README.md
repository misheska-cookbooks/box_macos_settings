# box_macos_settings

Captures a number of commonly used ways of configuring macOS system settings
as library resources.

## Usage

Place a dependency on the box_macos_settings cookbook in your cookbook's metadata.rb

```ruby
depends 'box_macos_settings', '~> 0.1'
```

Then, in a recipe use one of the resources, for example:

```ruby
macos_automatic_update_check 'disable' do
  action :set
end
```

A default recipe is provided that has all the settings I use on my machine.

## Resource Overview

- [macos_automatic_update_check](#macos_automatic_update_check): configures
  automatic check for updates
- [macos_hostname](#macos_hostname): configures the hostname
- [macos_remote_login](#macos_remote_login): configures access to the node via
  SSH
- [macos_screen_sharing](#macos_screen_sharing): configures access to the node
  via VNC/screen sharing
  
## Resource Details
## macos_automatic_update_check

The `macos_automatic_update_check` resource enables/disables the automatic
check for updates.

### Examples

- Disable automatic check for updates

```ruby
macos_automatic_update_check 'disable' do
  action :set
end
```

- Enable automatic check for updates

```ruby
macos_automatic_update_check 'enable' do
  action :set
end
```

## macos_hostname

The `macos_hostname` resource sets the ComputerName/HostName/LocalHostName.
macOS allows a node to have one name that apepars locally, another that
shows up on file sharing and a third that is visible to Terminal and SSH.

- ComputerName - The user-friendly name for the Mac that shows up on the
                 machine itself and what is visible in the Sharing preferences.
- HostName - The name assigned to the machine that is visible from the command
             line and when connecting through SSH/Remote Login.
- LocalHostName - The name used by Bonjour and visible through file sharing
                  services like AirDrop.

By default the resource will set all three names to the same value, but you
can set them independently if you so wish.

### Examples

- Set the ComputerName, HostName and LocalHostName to all have the value 'phoo'

```ruby
macos_hostname 'phoo' do
  action :set
end
```

- Set the ComputerName, HostName and LocalHostName to different things

```ruby
macos_hostname 'misheska' do
  host_name 'misheska'
  local_host_name 'MacBook'
  computer_name "Mischa's MacBook"
  action :set
end
```

## macos_remote_login

The `macos_remote_login` resource enables/disables the ability for users of
other computers to access the current node using SSH and SFTP.

### Examples

- Disable remote login

```ruby
macos_remote_login 'disable' do
  action :set
end
```

- Enable remote login

```ruby
macos_remote_login 'enable' do
  action :set
end
```

## macos_screen_sharing

The `macos_screen_sharing` resource enables/disables the ability for other
users to access thie current node's screen via `vnc://<ipaddress>` or by
looking for the hostname in the Finder sidebar.

### Examples

- Disable screen sharing

```ruby
macos_screen_sharing 'disable' do
  action :set
end
```

- Enable screen sharing

```ruby
macos_screen_sharing 'enable' do
  action :set
end
```

## Install locally

To use this cookbook locally without a Chef Server, run the following commands:

````
chef exec berks vendor
chef-client --local-mode --log_level error --override-runlist "box_macos_settings" --config-option cookbook_path="$(pwd)/berks-cookbooks"
```

