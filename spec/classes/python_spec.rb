require 'spec_helper'

describe 'python' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should contain_package('python').with_ensure('2.7.3-boxen1')

    should contain_file('/opt/boxen/env.d/python.sh').with_source('puppet:///modules/python/python.sh')
  end
end
