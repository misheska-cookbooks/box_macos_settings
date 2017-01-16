# # encoding: utf-8

describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled') do
  its('exit_status') { should cmp 0 }
  its('stdout') { should match '1' }
end

describe command('launchctl --list | grep com.apple.screensharing.agent.launchd') do
  its('exit_status') { should cmp 1 }
end
