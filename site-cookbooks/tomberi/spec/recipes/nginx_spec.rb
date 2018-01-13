require 'spec_helper'

describe 'tomberi::nginx' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }
  before do
    stub_command('which nginx').and_return(false)
  end

  it { is_expected.to include_recipe('nginx::package') }

  it { is_expected.to upgrade_package('nginx') }
end
