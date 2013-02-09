require 'spec_helper'

describe 'python::distribute' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should contain_homebrew__formula('distribute').with(
      :before => 'Package[boxen/brews/python-distribute]',
    )
    should contain_package('boxen/brews/python-distribute').with(
      :ensure  => '0.6.30-boxen1',
      :require => 'Package[boxen/brews/python]',
    )
  end
end
