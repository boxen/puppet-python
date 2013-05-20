require 'spec_helper'

describe 'python::mkvirtualenv' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should include_class('python')

    should contain_file('/opt/boxen/env.d/python_venvwrapper.sh').with(
      :source => 'puppet:///modules/python/python_venvwrapper.sh'
    )
  end
end
