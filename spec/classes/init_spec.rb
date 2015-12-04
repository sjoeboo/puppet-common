require 'spec_helper'
describe 'puppet_common' do

  context 'with defaults for all parameters' do
    it { should contain_class('puppet_common') }
  end
end
