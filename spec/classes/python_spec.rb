require 'spec_helper'

describe 'python' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should include_class('boxen::config')
    should include_class('homebrew')
    should include_class('homebrew::config')
    should include_class('xquartz')
    should include_class('python::config')

    should contain_homebrew__formula('python').with(
      :before => 'Package[boxen/brews/python]'
    )
    should contain_package('boxen/brews/python').with_ensure('2.7.6-boxen3')
  end
end
