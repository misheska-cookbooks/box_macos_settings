# # encoding: utf-8

describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled') do
  its('exit_status') { should cmp 0 }
  its('stdout') { should match '0' }
end

describe command('systemsetup -getremotelogin') do
  its('exit_status') { should cmp 0 }
  its('stdout') { should match 'Remote Login: On' }
end

describe command('launchctl list com.apple.screensharing') do
  its('exit_status') { should cmp 0 }
  its('stdout') { should match 'com.apple.screensharing' }
end
