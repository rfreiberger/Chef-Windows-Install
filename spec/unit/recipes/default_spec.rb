#
# Cookbook:: web_content
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'Chef-Windows-Install::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates directory Sumo' do
      expect(chef_run).to create_directory('/etc/Sumo')
    end

    it 'creates file Example' do
      expect(chef_run).to create_file('/etc/Sumo/example.txt')
    end

    it 'permissions file Example' do
      expect(chef_run).to create_file('/etc/Sumo/example.txt').with(
        user: 'root',
        group: 'root',
      )
    end

    it 'contains file Example' do
      expect(chef_run). to render_file('/etc/Sumo/example.txt').with_content(/Hello World!/)
    end
  end

  context 'When all attributes are default, on CentOS 7.4.1708' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates directory Sumo' do
      expect(chef_run).to create_directory('/etc/Sumo')
    end

    it 'creates file Example' do
      expect(chef_run).to create_file('/etc/Sumo/example.txt')
    end

    it 'permissions file Example' do
      expect(chef_run).to create_file('/etc/Sumo/example.txt').with(
        user: 'root',
        group: 'root',
      )
    end

    it 'contains file Example' do
      expect(chef_run). to render_file('/etc/Sumo/example.txt').with_content(/Hello World!/)
    end
  end

  context 'When all attributes are default, on Windows 2012 R2' do
      let(:chef_run) do
          runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
          runner.converge(described_recipe)
      end

      it 'converges successfully' do
          expect { chef_run }.to_not raise_error
      end

      it 'creates directory Sumo' do
         expect(chef_run).to create_directory('C:\\Sumo\\')
      end

      it 'creates file Example' do
         expect(chef_run).to create_file('C:\\Sumo\\example.txt')
      end

      it 'permissions file Example' do
        expect(chef_run).to create_file('C:\\Sumo\\example.txt')
          .with(
            rights: [{ permissions: :full_control, principals: 'Everyone' }]
          )
      end

      it 'contains file Example' do
         expect(chef_run). to render_file('C:\\Sumo\\example.txt').with_content(/Hello World!/)
      end

  end
end
