require 'spec_helper'

describe 'python pip' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should include_class('homebrew')

    should contain_homebrew__formula('pip')
    should contain_package('boxen/brews/python-pip').with_ensure('1.2.1-boxen1')
  end
end
