#
# Cookbook:: box_macos_settings
# Spec:: default
#
# Copyright:: 2017, Mischa Taylor
# Licensed under the Apache License, Version 2.0

require 'spec_helper'

describe 'box_macos_settings::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'mac_os_x',
        version: '10.12'
      )
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
