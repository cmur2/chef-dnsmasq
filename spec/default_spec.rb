require 'chefspec'
begin require 'chefspec/deprecations'; rescue LoadError; end

describe 'dnsmasq::default' do
  let(:chef_runner) do
    cb_path = [Pathname.new(File.join(File.dirname(__FILE__), '..', '..')).cleanpath.to_s, 'spec/support/cookbooks']
    ChefSpec::ChefRunner.new(:cookbook_path => cb_path)
  end

  let(:chef_run) do
    chef_runner.converge 'dnsmasq::default'
  end
  
  it 'installs dnsmasq' do
    expect(chef_run).to install_package 'dnsmasq'
  end
  
  it 'configures dnsmasq' do
    expect(chef_run).to create_file_with_content "/etc/dnsmasq.conf", ""
  end

  it 'enables and starts dnsmasq' do
    expect(chef_run).to start_service 'dnsmasq'
    expect(chef_run).to set_service_to_start_on_boot 'dnsmasq'
  end
end
