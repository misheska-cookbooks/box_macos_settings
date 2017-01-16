#
# Cookbook:: box_macos_settings
# Spec:: box_macos_settings
#

require 'spec_helper'
require 'mixlib/shellout'

describe 'box_macos_settings_test::macos_automatic_update_check' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(
      platform: 'mac_os_x',
      version: '10.12',
      step_into: ['macos_automatic_update_check']
    )
    runner.converge(described_recipe)
  end

  context 'When current default is not set (exit status 1)' do
    let(:shellout) { double(exitstatus: 1, run_command: nil, error!: nil, live_stream: nil, :live_stream= => nil) }
    before { allow(Mixlib::ShellOut).to receive(:new).and_return(shellout) }

    it 'should configure automatic update check' do
      expect(chef_run).to run_execute(
        'enable automatic update check'
      ).with(
        command: 'defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool TRUE',
        user: 'root'
      )
    end
  end

  context 'When current default does not match desired' do
    let(:shellout) { double(exitstatus: 0, stdout: '0', run_command: nil, error!: nil, live_stream: nil, :live_stream= => nil) }
    before { allow(Mixlib::ShellOut).to receive(:new).and_return(shellout) }

    it 'should configure automatic update check' do
      expect(chef_run).to run_execute(
        'enable automatic update check'
      ).with(
        command: 'defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool TRUE',
        user: 'root'
      )
    end
  end

  context 'When current default matches desired' do
    let(:shellout) { double(exitstatus: 0, stdout: '1', run_command: nil, error!: nil, live_stream: nil, :live_stream= => nil) }
    before { allow(Mixlib::ShellOut).to receive(:new).and_return(shellout) }

    it 'should do nothing' do
      expect(chef_run).not_to run_execute(
        'enable automatic update check'
      )
    end
  end
end
