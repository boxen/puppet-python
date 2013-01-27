require 'spec_helper'

describe 'python distribute' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should include_class('homebrew')

    should contain_homebrew__formula('distribute')
    should contain_package('boxen/brews/python-distribute').with_ensure('0.6.30-boxen1')
  end
end
