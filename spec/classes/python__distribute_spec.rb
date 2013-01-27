require 'spec_helper'

describe 'python distribute' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should contain_package('python-distribute').with_ensure('0.6.30-boxen1')
  end
end
